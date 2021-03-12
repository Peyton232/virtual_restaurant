import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/games/ticTacToe.dart';
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
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ticTacToe()),
                          );
                        },
                        child: Text('Tic-Tac-Toe'),
                      ))),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () => null,
                    child: Text('Button B'),
                  ),
                ),
              )
            ])));
  }
}