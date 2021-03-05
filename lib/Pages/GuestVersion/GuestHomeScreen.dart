import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/CustomWidgets/KidsModeButton.dart';
import 'package:virtual_restaurant/CustomWidgets/BottomNavBarItems.dart';

class GuestHomeScreen extends StatefulWidget {
  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  //TODO: Don't let guest access welcome page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(RestaurantLogo)"),
        //TODO: Redo Logo to where it's more rectangular
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          KidsModeButton(),
          Row(
            children: <Widget>[
              CustomButton(
                //TODO: maybe add another property -> kid's mode true/false
                label: "Manager's Choice",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ManagersChoicePage");
                },
              ),
              CustomButton(
                label: "Menu",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/MenuPage");
                },
              ),
              CustomButton(
                label: "Call Waiter",
                buttonTapped: () {
                  print("Calling waiter now..");
                  //TODO: Add call waiter functionality here
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Earn Chance to Win Free Dessert",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/FreeDessertPage");
                },
              ),
              CustomButton(
                label: "Games",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/GamesPage");
                },
              ),
              CustomButton(
                label: "Request Drink Refills",
                buttonTapped: () {
                  print("Requesting drink refills now..");
                  //TODO: Add request drink functionality here
                },
              ),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomNavBarItems(
                  label: "Settings",
                  buttonTapped: () {
                    Navigator.pushNamed(context, "/SettingsPage");
                  },
                ),
                BottomNavBarItems(
                  label: "My Order",
                  buttonTapped: () {
                    Navigator.pushNamed(context, "/MyOrderPage");
                  },
                ),
                BottomNavBarItems(
                  label: "Pay Bill",
                  buttonTapped: () {
                    Navigator.pushNamed(context, "/PayBillPage");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
