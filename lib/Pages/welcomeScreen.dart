import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../CustomWidgets/CustomLoginCard.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Container(
            height: 90,
            child: Image.asset(
              "images/scrappyLogo1.png",
              fit: BoxFit.contain,
            ),
          ),
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
                Navigator.pushReplacementNamed(context, "/GuestHomeScreen");
              },
            ),
            CustomLoginCard(
              label: "Kitchen Mode",
              cardTapped: () {
                Navigator.pushNamed(context, "/KitchenHomeScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
