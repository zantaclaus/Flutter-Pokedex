// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pokedex/constant.dart';
import 'package:pokedex/pokemon_data.dart';
import 'home_screen.dart';

class DetailScreen extends StatefulWidget {
  final Map pokemonDetails;
  const DetailScreen({Key? key, required this.pokemonDetails})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Map data = widget.pokemonDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgrounds[widget.pokemonDetails["Type 1"]],
      appBar: buildAppBar(),
      body: tabController(context),
    );
  }

  DefaultTabController tabController(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          detailProfile(context),
          imageProfile(context),
          buildController()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFF9F8FD),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        },
      ),
      title: Text(
        "Pokedex",
        style: TextStyle(
            fontSize: 24,
            color: Color(0xFF3C4046),
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Container detailProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: backgrounds[widget.pokemonDetails["Type 1"]],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 220,
            // decoration: BoxDecoration(color: Colors.green),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.pokemonDetails["Name"],
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      pokemonType("Type 1", 0),
                      widget.pokemonDetails["Type 2"] != ""
                          ? pokemonType("Type 2", 10)
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 100,
            // decoration: BoxDecoration(color: Colors.pink),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "#" + widget.pokemonDetails["Number"],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container pokemonType(String type, double marginLeft) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colors[widget.pokemonDetails["Type 1"]],
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: marginLeft),
        child: Text(
          widget.pokemonDetails[type],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container imageProfile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration:
          BoxDecoration(color: backgrounds[widget.pokemonDetails["Type 1"]]),
      child: SizedBox(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    ),
                child: Image.asset(
                    "assets/pokemon/${widget.pokemonDetails["Number"]}.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DefaultTabController buildController() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          buildTabbar(),
          buildTabbatView(),
        ],
      ),
    );
  }

  Container buildTabbar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TabBar(
        tabs: [
          Tab(text: "Base Stats"),
          Tab(text: "Evolution"),
        ],
        labelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        indicatorColor: Colors.deepPurple,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3),
          insets: EdgeInsets.symmetric(horizontal: 30),
        ),
      ),
    );
  }

  Container buildTabbatView() {
    int total = int.parse(widget.pokemonDetails["HP"]) +
        int.parse(widget.pokemonDetails["Attack"]) +
        int.parse(widget.pokemonDetails["Defense"]) +
        int.parse(widget.pokemonDetails["Sp. Atk"]) +
        int.parse(widget.pokemonDetails["Sp. Def"]) +
        int.parse(widget.pokemonDetails["Speed"]);

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TabBarView(
        children: [
          Container(
            // decoration: BoxDecoration(color: Colors.amber),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.pink),
                    child: Column(
                      children: [
                        statTitle("HP"),
                        statTitle("Attack"),
                        statTitle("Defense"),
                        statTitle("Sp. Atk"),
                        statTitle("Sp. Def"),
                        statTitle("Speed"),
                        statTitle("Total"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.blue[400]),
                    child: Column(
                      children: [
                        statNumber(widget.pokemonDetails["HP"]),
                        statNumber(widget.pokemonDetails["Attack"]),
                        statNumber(widget.pokemonDetails["Defense"]),
                        statNumber(widget.pokemonDetails["Sp. Atk"]),
                        statNumber(widget.pokemonDetails["Sp. Def"]),
                        statNumber(widget.pokemonDetails["Speed"]),
                        statNumber(total.toString()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    // decoration: BoxDecoration(color: Colors.green[400]),
                    child: Column(
                      children: [
                        statBar(widget.pokemonDetails["HP"], 200, 1),
                        statBar(widget.pokemonDetails["Attack"], 200, 2),
                        statBar(widget.pokemonDetails["Defense"], 200, 1),
                        statBar(widget.pokemonDetails["Sp. Atk"], 200, 2),
                        statBar(widget.pokemonDetails["Sp. Def"], 200, 1),
                        statBar(widget.pokemonDetails["Speed"], 200, 2),
                        statBar(total.toString(), 1000, 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.directions_transit),
        ],
      ),
    );
  }

  Container statTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
    );
  }

  Container statNumber(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }

  Container statBar(String stat, int max, int barType) {
    var barColor = barType == 1 ? Colors.green : Colors.red;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.4),
      child: Stack(
        children: [
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          FractionallySizedBox(
            widthFactor: double.parse(stat) / max,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
