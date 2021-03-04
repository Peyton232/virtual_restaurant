import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                "Appetizers",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
          Container(
            child: Center(
              child: Text(
                "Entrees",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
          Container(
            child: Center(
              child: Text(
                "Sides",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
          Container(
            child: Center(
              child: Text(
                "Drinks",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
          Container(
            child: Center(
              child: Text(
                "Kid's Meal",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
          Container(
            child: Center(
              child: Text(
                "Dessert",
                textAlign: TextAlign.center,
              ),
            ),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
