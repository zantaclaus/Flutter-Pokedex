import 'package:flutter/material.dart';
import 'package:pokedex/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primaryColor: Color.fromRGBO(109, 241, 210, 100),
          // primarySwatch: Color(0xFFF9F8FD),
          ),
      home: HomeScreen(),
    );
  }
}
