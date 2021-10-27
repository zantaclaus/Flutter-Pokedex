// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/screens/detail_screan.dart';
import '../pokemon_data.dart';
import '../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> data = pokemonData;
  int maxItems = 20;
  int addMore = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 20),
        children: <Widget>[
          buildGridView(),
          maxItems < data.length
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      if (maxItems + addMore < data.length) {
                        maxItems += addMore;
                        print("add more");
                        print(maxItems);
                      } else
                        maxItems = data.length;
                    });
                  },
                  child: Text('load more'))
              : Container()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFF9F8FD),
      title: Text(
        "Pokedex",
        style: TextStyle(
            fontSize: 24,
            color: Color(0xFF3C4046),
            fontWeight: FontWeight.w800),
      ),
    );
  }

  GridView buildGridView() {
    return GridView.builder(
      itemCount: maxItems,
      shrinkWrap: true,
      padding: EdgeInsets.all(6),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 0.66,
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10
      ),
      itemBuilder: (ctx, i) => GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(
              pokemonDetails: data[i],
            );
          }));
        },
        child: pokemonCard(i),
      ),
    );
  }

  Container pokemonCard(int i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgrounds[data[i]["Type 1"]],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 50,
            offset: Offset(0, 10),
          )
        ],
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.only(top: 15, left: 10),
      child: Stack(
        children: [
          Text(
            data[i]["Name"],
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          pokemonType(i, 25, "Type 1"),
          data[i]["Type 2"] != "" ? pokemonType(i, 53, "Type 2") : Container(),
          Positioned(
            width: 80,
            right: 0,
            bottom: 0,
            child: Image.asset("assets/pokeball.png"),
          ),
          Positioned(
            width: 80,
            right: 10,
            bottom: 5,
            child: Image.asset(
              "assets/pokemon/${data[i]["Number"]}.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Positioned pokemonType(int i, double fromTop, String type) {
    return Positioned(
      top: fromTop,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors[data[i]["Type 1"]],
        ),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        child: Text(
          data[i][type],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
