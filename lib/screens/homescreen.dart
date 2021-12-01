import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> mainDataList = [
    "Alien",
    "Selection",
    "Collective",
    "Benita",
    "Ritual",
    "Conex",
    "Way",
    "MadKing",
    "ApexSite",
    "KinderLot",
    "AquaVew",
    "PalmPal",
    "ShowTeam",
    "MrSpy",
    "CinderBloom",
    "MagicSword",
    "Laine",
    "Shapez",
    "Laine",
    "PuzzleLink",
    "Philler",
    "Palaz",
    "FlexBrand",
    "GhostLine",
    "PalmPal",
    "GoldRiver",
    "ClearMode",
    "Ryver",
    "Shapez",
    "Paramyter",
    "GalaxeWayz",
    "Phoenix",
    "TellTaleMedia",
    "Iceberg",
    "CalciteX",
    "Cuckoo",
    "FilterFlow",
    "AceLogic",
    "Colorax",
    "ClearMode",
    "SharpBlunt",
    "Angelito",
    "Creativity",
    "BendR",
    "LizardWizard",
    "CoClown",
    "Infinite",
    "BlinkEye",
    "EcoFriendly",
    "ReelLite",
    "Technomaniac",
    "CranialSpace",
    "Arya",
    "Atilla",
    "IntoSpace",
    "BigPapa",
    "Coconut",
    "HandlerStrata",
    "Flynt",
    "SINK",
    "EnerG",
    "Fearless",
    "Okeanos",
    "Foenix",
    "MassiveStroke",
    "Papaya",
    "NightWish",
    "Nemesis",
    "Mobyle",
    "SaviorAngel",
    "Arissa",
  ];

  List<String> favoriteDataList = [];

  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("key", list);
    return true;
  }

  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) {
      favoriteDataList = prefs.getStringList("key")!;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getSavedList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "StarName",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                Text(
                  "Startup Name Generator",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ]),
          leading: Padding(
            padding: EdgeInsets.all(2.0),
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          bottom: const TabBar(
            indicatorColor: Colors.orangeAccent,
            automaticIndicatorColorAdjustment: false,
            tabs: [
              Tab(icon: Icon(Icons.article_rounded)),
              Tab(icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: mainDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: SelectableText(
                            mainDataList[index],
                            cursorColor: Colors.deepOrangeAccent,
                            showCursor: false,
                            toolbarOptions: const ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
                            style: const TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (!favoriteDataList
                                .contains(mainDataList[index])) {
                              favoriteDataList.add(mainDataList[index]);
                            }
                            _saveList(favoriteDataList);
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrangeAccent,
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                        color: Colors.orangeAccent)))),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            favoriteDataList.isEmpty
                ? const Center(
                    child: Text(
                      "You don't have a star name yet!",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteDataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: SelectableText(
                                  favoriteDataList[index],
                                  cursorColor: Colors.deepOrangeAccent,
                                  showCursor: false,
                                  toolbarOptions: const ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: const TextStyle(fontSize: 17.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  favoriteDataList
                                      .remove(favoriteDataList[index]);
                                  _saveList(favoriteDataList);
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.deepOrangeAccent,
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: const BorderSide(
                                              color: Colors.orangeAccent)))),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
