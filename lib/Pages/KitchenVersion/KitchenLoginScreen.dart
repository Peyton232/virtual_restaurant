import 'dart:ui';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This is where the manager can input their credentials to access
ManagerHomeScreen.dart
 */

class KitchenLoginScreen extends StatelessWidget {
  String password = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitchen Login Screen"),
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
              Icons.kitchen,
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
                    "Username: ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Name',
                    ),
                    onChanged: (text) {
                      username = text;
                    },
                  ),
                ],
              ),
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
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Password',
                    ),
                    obscureText: true,
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
                print(["username = ", username]);
                print(["password = ", password]);
                getWaiterInfo(); // grabbing data from database for orders
                Navigator.pushReplacementNamed(context, "/KitchenHomeScreen");
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
