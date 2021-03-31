import 'dart:ui';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:flutter/material.dart';

/*
This is the page where the parents or guardians can set up a passcode
when they enter kids mode
 */

class KidsModeEntrancePage extends StatefulWidget {
  @override
  _KidsModeEntrancePageState createState() => _KidsModeEntrancePageState();
}

class _KidsModeEntrancePageState extends State<KidsModeEntrancePage> {
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kid\'s Mode Password Setup"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              //color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Password: ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Password for Kid\'s Mode',
                    ),
                    onChanged: (text) {
                      password = text;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  print(["password = ", password]);
                  kidsModePassword = password;
                  Navigator.popAndPushNamed(context, "/KidsModeExitPage");
                  Navigator.pushNamed(context, "/GamesPage");
                },
                child: Text("Enter Kid's Mode"))
          ],
        ),
      ),
    );
  }
}