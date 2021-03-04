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
          "(RestaurantLogo)",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomLoginCard(
              label: "Manager Login",
              cardTapped: () {
                Navigator.pushNamed(context, "/ManagerLoginScreen");
              },
            ),
            CustomLoginCard(
              label: "Waiter Login",
              cardTapped: () {
                Navigator.pushNamed(context, "/WaiterLoginScreen");
              },
            ),
            CustomLoginCard(
              label: "Tabletop Mode",
              cardTapped: () {
                Navigator.pushNamed(context, "/GuestHomeScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
