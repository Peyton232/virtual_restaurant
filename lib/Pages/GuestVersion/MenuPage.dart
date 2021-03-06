import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MenuSubpageTemplate.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

/*
This file is used to display the different menu categories
 */

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
                icon: Icons.bakery_dining,
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
                icon: Icons.fastfood,
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
                icon: Icons.local_dining,
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
                icon: Icons.local_cafe,
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
                icon: Icons.emoji_emotions,
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
                icon: Icons.icecream,
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
