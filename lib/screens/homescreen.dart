import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> mainDataList = [
    "Aria",
    "Titus",
    "Huxley",
    "Scout",
    "Cecily",
    "Paxon",
    "Sylar",
    "Phine",
    "Ziyra",
    "Trixie",
    "Quinly",
    "Abra",
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
              children: [
                Text(
                  "StarName",
                  style: GoogleFonts.balsamiqSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  "Startup Name Generator",
                  style: GoogleFonts.balsamiqSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                            style: GoogleFonts.balsamiqSans(
                              textStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black87,
                                letterSpacing: 1,
                              ),
                            ),
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
                ? Center(
                    child: Text(
                      "You don't have a star name yet!",
                      style: GoogleFonts.balsamiqSans(
                        textStyle:  const TextStyle(
                          fontSize: 17.0,
                          color: Colors.black54,
                          letterSpacing: 1,
                        ),
                      ),
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
                                  style: GoogleFonts.balsamiqSans(
                                    textStyle: const TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black87,
                                      letterSpacing: 1,
                                    ),
                                  ),
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
