import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MenuSubpageTemplate.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Appetizers",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Appetizers",
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                label: "Entrees",
                buttonTapped: () {
                  print("Go to entrees sub page");
                },
              ),
              CustomButton(
                label: "Sides",
                buttonTapped: () {
                  print("Go to sides sub page");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Drinks",
                buttonTapped: () {
                  print("Go to drinks sub page");
                },
              ),
              CustomButton(
                label: "Kid's Meal",
                buttonTapped: () {
                  print("Go to kid's meal sub page");
                },
              ),
              CustomButton(
                label: "Dessert",
                buttonTapped: () {
                  print("Go to dessert sub page");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
