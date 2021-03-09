import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MenuSubpageTemplate.dart';
import 'package:virtual_restaurant/Data/MenuClass.dart';

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
                        listOfMenuItems:
                            appetizerMenuItems, //TODO: How to pass list to another class
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
                        listOfMenuItems:
                            entreesMenuItems, //TODO: How to pass list to another class
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
                        listOfMenuItems:
                            sideMenuItems, //TODO: How to pass list to another class
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
                        listOfMenuItems:
                            drinksMenuItems, //TODO: How to pass list to another class
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
                        listOfMenuItems:
                            kidsMealMenuItems, //TODO: How to pass list to another class
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
                        listOfMenuItems:
                            dessertMenuItems, //TODO: How to pass list to another class
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
