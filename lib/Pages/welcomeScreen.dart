import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../CustomWidgets/CustomLoginCard.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        backgroundColor: kDarkGreen,
        title: Text(
          "RestaurantLogo",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomLoginCard(
              label: "Manager Login",
            ),
            CustomLoginCard(
              label: "Waiter Login",
            ),
            CustomLoginCard(
              label: "Tabletop Mode",
            ),
          ],
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// cardPressed = !cardPressed;
// });
//
// print("${widget.label} has been pressed");
// //widget.cardTapped();
// },
// child: Container(
// height: 100,
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: Colors.grey[700],
// blurRadius: 6.0,
// offset: Offset(3.0, 3.0))
// ],
// color: cardPressed ? kOffWhite : Colors.grey[200],
// ),
// child: Center(
// child: Text(
// widget.label,
// style: kLoginCardTextStyle,
// ),
// ),
// ),
// ),
