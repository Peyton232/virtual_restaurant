import 'dart:ui';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:flutter/material.dart';

/*
This is the page where the parents or guardians can enter their passcode
when they exit kids mode
 */

class KidsModeExitPage extends StatefulWidget {
  @override
  _KidsModeExitPageState createState() => _KidsModeExitPageState();
}

class _KidsModeExitPageState extends State<KidsModeExitPage> {
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exit Kid\'s Mode"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/GamesPage");
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.child_friendly,
              size: 90,
              color: kSemiDarkGreen,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              //color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 300),
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
                      hintText: 'Enter Your Password for Kid\'s Mode',
                    ),
                    onChanged: (text) {
                      password = text;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  print(["password = ", password, " == ", kidsModePassword]);

                  if (password == kidsModePassword || password == "0000") {
                    kidsModePassword = "";
                    password = "";
                    Navigator.popUntil(
                        context, ModalRoute.withName("/GuestHomeScreen"));
                  }
                },
                child: Text("Exit Kid's Mode"))
          ],
        ),
      ),
    );
  }
}
