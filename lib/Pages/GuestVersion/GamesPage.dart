import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
      ),
    );
  }
}
