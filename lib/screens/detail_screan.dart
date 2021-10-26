// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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
}
