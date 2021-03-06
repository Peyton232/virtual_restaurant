import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

/*
This file displays the manager's choice of menu item. THe customer can order this if they are interested
 */

class ManagersChoicePage extends StatefulWidget {
  @override
  _ManagersChoicePageState createState() => _ManagersChoicePageState();
}

class _ManagersChoicePageState extends State<ManagersChoicePage> {
  @override
  Widget build(BuildContext context) {
    print(globals.mealOFTheDay.getImageStr);
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager's Choice"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: 400,
                width: 800,
                color: kOffWhite,
                child: Center(
                  child: Image.network(globals.mealOFTheDay.getImageStr),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: Text(
                  "${globals.mealOFTheDay.name}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  print("Order button pressed");
                  //TODO: Add order functionality here

                  globals.order.add(globals.mealOFTheDay);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kLightGreen),
                  elevation: MaterialStateProperty.all(4.0),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.green[300]),
                ),
                child: Container(
                  height: 60,
                  width: 350,
                  child: Center(
                    child: Text(
                      "Order Now!",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
