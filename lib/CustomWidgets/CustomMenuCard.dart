import 'package:flutter/material.dart';
import '../Data/constants.dart';

class MenuCard extends StatefulWidget {
  final String label; // identification for the card
  final Function cardTapped; // function to say if it was tapped

  MenuCard({this.label, this.cardTapped}); // referrs to itself for the label and funtion

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: (){
          print("${widget.label} has been pressed");
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
              style: kLoginCardTextStyle,  // took this from login screen style
            )
          )
        )

      ),
    );
  }
}


