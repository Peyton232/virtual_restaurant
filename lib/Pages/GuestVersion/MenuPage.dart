import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MenuSubpageTemplate.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add "View Order" Button
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
                        listOfMenuItems: globals
                            .appetizers, //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                label: "Entrees",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Entrees",
                        listOfMenuItems: globals
                            .entrees, //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                label: "Sides",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Sides",
                        listOfMenuItems: globals
                            .sides, //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Drinks",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Drinks",
                        listOfMenuItems: globals.drinks,
                        //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                label: "Kid's Meal",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Kid's Meal",
                        listOfMenuItems: globals
                            .kidsMeals, //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
              CustomButton(
                label: "Dessert",
                buttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuSubpageTemplate(
                        //TODO: This will take in a list of the menu class
                        menuCategory: "Dessert",
                        listOfMenuItems: globals
                            .desserts, //TODO: How to pass list to another class
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}