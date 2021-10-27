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
      backgroundColor: backgrounds[widget.pokemonDetails["Type 1"]],
      appBar: buildAppBar(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(color: Colors.amber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(color: Colors.green),
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
                              pokemonType("Type 2", 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(color: Colors.pink),
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(color: Colors.black),
              child: Expanded(
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
                          color: Colors.amber,
                        ),
                        child: Image.asset(
                            "assets/pokemon/${widget.pokemonDetails["Number"]}.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
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
}
