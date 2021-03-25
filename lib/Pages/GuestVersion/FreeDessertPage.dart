import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/QRPage.dart';

/*
This is the page where the user can earn the chance to win a free dessert.
If the customer wins, they will be taken to the QR page where they can redeem
(next) or (current) order
 */

class SpinningWheel extends StatefulWidget {
  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Free Dessert! ',
      'Sorry, Try again ',
      'So Close! ',
    ];

    final int rotationCount = 4;
    bool animateWheel = false;

    //Changed the UI of the page to make it more user friendly
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Dessert"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            //flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FortuneWheel(
                animateFirst: animateWheel,
                selected: selected,
                onAnimationEnd: () {
                  if (selected == 0) {
                    createAlertDialog(context);
                  } else {
                    animateWheel = false;
                  }
                },
                items: [
                  FortuneItem(
                    style: FortuneItemStyle(
                      color: Colors.green,
                      borderColor: kOffWhite,
                      borderWidth: 2,
                    ),
                    child: Text(
                      "Free Dessert!",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  FortuneItem(
                    style: FortuneItemStyle(
                      color: Colors.blue[700],
                      borderColor: kOffWhite,
                      borderWidth: 2,
                    ),
                    child: Text(
                      "Sorry, Try again",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  FortuneItem(
                    style: FortuneItemStyle(
                      color: Colors.red[700],
                      borderColor: kOffWhite,
                      borderWidth: 2,
                    ),
                    child: Text(
                      "So Close!",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kGreen,
            ),
            onPressed: () {
              setState(() {
                animateWheel = true;
                selected = Random().nextInt(items.length);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              child: Text(
                "Spin",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("You won a free dessert!"),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                'Claim',
                style: TextStyle(
                  fontSize: 18.0,
                  color: kSemiDarkGreen,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(customController.text.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QR(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}