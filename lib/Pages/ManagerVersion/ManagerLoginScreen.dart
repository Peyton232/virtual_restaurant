import 'dart:ui';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class ManagerLoginScreen extends StatefulWidget {
  @override
  _ManagerLoginScreenState createState() => _ManagerLoginScreenState();
}

class _ManagerLoginScreenState extends State<ManagerLoginScreen> {
  TextEditingController _usernameController;

  TextEditingController _passwordController;

  void initState(){
    _usernameController = TextEditingController();
    _usernameController.text = "admin";

    _passwordController = TextEditingController();
    _passwordController.text = "admin";
  }

  @override
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager Login Screen"),
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
              Icons.group,
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
                    controller: _usernameController,
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
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Password',
                    ),
                    controller: _passwordController,
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
                if(_usernameController.text == "admin" && _passwordController.text == "admin")
                  {
                    getReportsInfo();
                    getItemsSoldInfo();
                    Navigator.pushReplacementNamed(context, "/ManagerHomeScreen");
                  }

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
