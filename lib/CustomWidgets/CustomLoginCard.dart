import 'package:flutter/material.dart';
import '../Data/constants.dart';

/*
This is used to create the button cards in welcomePage.dart
 */

class CustomLoginCard extends StatefulWidget {
  final String label;
  final Function cardTapped;

  CustomLoginCard({this.label, this.cardTapped});

  @override
  _CustomLoginCardState createState() => _CustomLoginCardState();
}

class _CustomLoginCardState extends State<CustomLoginCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 60, right: 60),
      child: ElevatedButton(
        onPressed: () {
          widget.cardTapped();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kOffWhite),
          elevation: MaterialStateProperty.all(4.0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
        ),
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              widget.label,
              style: kLoginCardTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
