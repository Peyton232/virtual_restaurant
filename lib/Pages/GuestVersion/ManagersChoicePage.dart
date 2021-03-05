import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class ManagersChoicePage extends StatefulWidget {
  @override
  _ManagersChoicePageState createState() => _ManagersChoicePageState();
}

class _ManagersChoicePageState extends State<ManagersChoicePage> {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.grey,
                child: Center(
                  child: Text("Manager's Choice Image"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: Text(
                  "(Menu Item Name)",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: ElevatedButton(
                onPressed: () {
                  print("Order button pressed");
                  //TODO: Add order functionality here
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kLightGreen),
                  elevation: MaterialStateProperty.all(4.0),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.grey[300]),
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
