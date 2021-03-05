import 'dart:ui';

import 'package:flutter/material.dart';

class WaiterLoginScreen extends StatelessWidget {
  String password = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiter Login Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              //color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                  onChanged: (text){
                    username = text;
                  },
                ),
              ),
            ),
            Container(
              //color: Colors.teal,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Center(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                  onChanged: (text){
                    password = text;
                  },
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(150,50),
              ),
                onPressed: (){
                print(["username = ",username]);
                print(["password = ",password]);
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
