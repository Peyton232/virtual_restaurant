import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This is used to create the kids mode button in the GuestHomeScreen.dart
 */

class KidsModeButton extends StatefulWidget {
  @override
  _KidsModeButtonState createState() => _KidsModeButtonState();
}

class _KidsModeButtonState extends State<KidsModeButton> {
  bool kidsModeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 10,
        left: 30,
        right: 30,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            //kidsModeSelected = !kidsModeSelected;
            Navigator.pushNamed(context, "/KidsModeEntrancePage");
            //TODO: Takes user to another page to set up a passcode
            //TODO: OR take to the games page
          });
        },
        child: Container(
          height: 70,
          width: 180,
          decoration: BoxDecoration(
            color: kidsModeSelected ? kOffWhite : kMintGreen,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500], blurRadius: 3, offset: Offset(2, 2))
            ],
          ),
          child: Center(
            child: Text(
              "Kid's Mode",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: kidsModeSelected ? Colors.grey[400] : kSemiBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
