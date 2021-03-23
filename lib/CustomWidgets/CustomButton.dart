import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
/*
This is used to create the button cards for the GuestHomeScreen.dart
and MenuPage.dart
 */

class CustomButton extends StatefulWidget {
  final String label;
  final Function buttonTapped;

  CustomButton({
    this.label,
    this.buttonTapped,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: ElevatedButton(
          onPressed: () {
            widget.buttonTapped();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kOffWhite),
            elevation: MaterialStateProperty.all(4.0),
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
          ),
          child: Container(
            height: 200,
            width: 300,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(fontSize: 30, color: kSemiBlack),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
