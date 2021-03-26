import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/CheckoutPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/FreeDessertPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GamesPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GuestHomeScreen.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/ManagersChoicePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/PayBillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyBillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/RequestRefillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SettingsPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SplitBillPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ChangeMenuPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerHomeScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerLoginScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerReportPage.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterLoginScreen.dart';
import 'package:virtual_restaurant/Pages/KitchenVersion/KitchenLoginScreen.dart';

import 'package:virtual_restaurant/Pages/GuestVersion/games/MineSweeper.dart';

import 'package:virtual_restaurant/Pages/KitchenVersion/KitchenHomeScreen.dart';
import 'Pages/GuestVersion/QRPage.dart';

import 'Pages/welcomeScreen.dart';
import 'Data/constants.dart';
import 'Pages/GuestVersion/MenuPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/test.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kDarkGreen,
        scaffoldBackgroundColor: kOffWhite,
      ),
      title: 'Virtual Restaurant',
      initialRoute: "/WelcomeScreen",
      //This is where you will put the different pages we can navigate to
      routes: {
        "/WelcomeScreen": (context) => WelcomePage(),
        "/GuestHomeScreen": (context) => GuestHomeScreen(),
        "/ManagerHomeScreen": (context) => ManagerHomeScreen(),     // need to change this back
        "/ManagerReportPage": (context) => ManagerReportPage(),
        "/ManagerLoginScreen": (context) => ManagerLoginScreen(),
        "/KitchenLoginScreen": (context) => KitchenLoginScreen(),
        "/ChangeMenuPage": (context) => ChangeMenuPage(),
        "/WaiterLoginScreen": (context) => WaiterLoginScreen(),
        "/MenuPage": (context) => MenuScreen(),
        "/SettingsPage": (context) => SettingsPage(),
        //"/MyOrderPage": (context) => MyOrderPage(),
        "/PayBillPage": (context) => PayBillPage(),
        "/MyBillPage": (context) => MyBillPage(),
        "/ManagersChoicePage": (context) => ManagersChoicePage(),
        "/MyOrderPage": (context) => MyOrderPage(),
        "/FreeDessertPage": (context) => SpinningWheel(),
        "/QRPage": (context) => QR(),
        "/GamesPage": (context) => GamesPage(),
        "/RequestRefillPage": (context) => RequestRefillPage(),
        "/SplitBillPage": (context) => SplitBillPage(),
        //"/KidsModeEntrancePage": (context) => KidsModeEntrancePage(),
        //"/KidsModeExitPage": (context) => KidsModeExitPage(),
        "/MineSweeperPage": (context) => MineSweeperPage(),
        "/CheckoutPage": (context) => CheckoutPage(),
        "/KitchenHomeScreen": (context) => KitchenHomeScreen(),
      },
    );
  }
}
