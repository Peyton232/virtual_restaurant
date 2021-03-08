import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';

class ChangeMenuPage extends StatefulWidget {
  @override
  _ChangeMenuPageState createState() => _ChangeMenuPageState();
}

/*
  - Use draggable and dragtarget widget
  - draggable and drag target should have the same category
 */

class _ChangeMenuPageState extends State<ChangeMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Menu"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: kOffWhite,
              child: Column(
                children: <Widget>[
                  Text(
                    "Current Menu:",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 250,
                      color: kMintGreen,
                      child: Text("Entree"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: kLightGreen,
              child: Text("Testing"),
            ),
          ),
        ],
      ),
    );
  }
}
