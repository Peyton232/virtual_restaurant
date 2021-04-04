import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Database/database.dart';
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
              icon: Icons.supervisor_account,
              label: "Manager Login",
              cardTapped: () {
                loadMenuLists();
                Navigator.pushNamed(context, "/ManagerLoginScreen");
              },
            ),
            CustomLoginCard(
              icon: Icons.assignment_ind,
              label: "Waiter Login",
              cardTapped: () {
                Navigator.pushNamed(context, "/WaiterLoginScreen");
              },
            ),
            CustomLoginCard(
              icon: Icons.tablet,
              label: "Tabletop Mode",
              cardTapped: () {
                loadMenuLists();
                //Disables back button when going to the guest home page
                Navigator.pushReplacementNamed(context, "/GuestHomeScreen");
                //Enables back button when going to the guest home page
                //Navigator.pushNamed(context, "/GuestHomeScreen");
              },
            ),
            CustomLoginCard(
              icon: Icons.kitchen,
              label: "Kitchen Mode",
              cardTapped: () {
                Navigator.pushNamed(context, "/KitchenLoginScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
