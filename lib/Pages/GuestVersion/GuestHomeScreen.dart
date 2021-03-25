import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/CustomWidgets/KidsModeButton.dart';
import 'package:virtual_restaurant/CustomWidgets/BottomNavBarItems.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

/*
This is the screen page that the user will see on the table.
 */

class GuestHomeScreen extends StatefulWidget {
  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  final snackBar = SnackBar(content: Text("Waiter is coming soon..."));

  //TODO: Don't let guest access welcome page
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //Disables back button in software and hardware
      onWillPop: () async => false,
      child: Scaffold(
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
                    createAlertDialog(context);
                    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    Navigator.pushNamed(context, "/RequestRefillPage");
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 100,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyOrderPage(
                                orderID: "Order I-7845",
                                //TODO: Add order ID here
                                //TODO: Pass current list of order here
                              );
                            },
                          ),
                        );
                      },
                    ),
                    BottomNavBarItems(
                      label: "My Bill",
                      buttonTapped: () {
                        Navigator.pushNamed(context, "/MyBillPage");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Waiter is coming soon"),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 18.0,
                  color: kSemiDarkGreen,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}