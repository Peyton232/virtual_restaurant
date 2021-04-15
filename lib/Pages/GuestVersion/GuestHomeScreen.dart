import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/CustomWidgets/KidsModeButton.dart';
import 'package:virtual_restaurant/CustomWidgets/BottomNavBarItems.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

/*
This file is used to display the home screen for the guest. It displays major options such as manager's choice,
menu, call waiter, free dessert, games, requests drink refill, order details, and more.
 */

class GuestHomeScreen extends StatefulWidget {
  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  final snackBar = SnackBar(content: Text("Waiter is coming soon..."));

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          KidsModeButton(),
          Row(
            children: <Widget>[
              CustomButton(
                //TODO: maybe add another property -> kid's mode true/false
                label: "Manager's Choice",
                icon: Icons.favorite,
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ManagersChoicePage");
                  //Navigator.pushNamed(context, "/KitchenHomeScreen");
                },
              ),
              CustomButton(
                icon: Icons.restaurant,
                label: "Menu",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/MenuPage");
                },
              ),
              CustomButton(
                icon: Icons.phone,
                label: "Call Waiter",
                buttonTapped: () {
                  //TODO: Add call waiter functionality here

                  sendWaiterRequest();

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Waiter is coming soon!"),
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
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                icon: Icons.cake,
                label: "Earn Chance to Win Free Dessert",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/FreeDessertPage");
                },
              ),
              CustomButton(
                icon: Icons.sports_esports,
                label: "Games",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/GamesPage");
                },
              ),
              CustomButton(
                icon: Icons.local_drink,
                label: "Request Drink Refills",
                buttonTapped: () {
                  requestRefill();

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            "Waiter is coming soon to refill your drink(s)!"),
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
                  //Navigator.pushNamed(context, "/RequestRefillPage");
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
        ],
      ),
    );
  }
}
