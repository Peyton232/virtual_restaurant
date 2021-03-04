import 'package:flutter/material.dart';
import '../CustomWidgets/CustomMenuCard.dart';

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
        MenuCard(
          label: "Appetizers",
        ),
          MenuCard(
            label: "Entrees",
          ),
          MenuCard(
            label: "Sides",
          ),
          MenuCard(
            label: "Drinks",
          ),
          MenuCard(
            label: "Kid's Meal",
          ),
          MenuCard(
            label: "Dessert",
          ),
        ],
      ),
    );
  }
}
