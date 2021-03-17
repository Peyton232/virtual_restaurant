import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/FreeDessertPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GamesPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GuestHomeScreen.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/ManagersChoicePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/PayBillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/RequestRefillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SettingsPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SplitBillPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ChangeMenuPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerHomeScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerLoginScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerReportPage.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterLoginScreen.dart';
import 'package:virtual_restaurant/Pages/KitchenVersion/KitchenHomeScreen.dart';
import 'Pages/GuestVersion/QRPage.dart';
import 'Pages/welcomeScreen.dart';
import 'Data/constants.dart';
import 'Pages/MenuPage.dart';

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
        "/KitchenHomeScreen": (context) => KitchenHomeScreen(),
        "/ManagerHomeScreen": (context) => ManagerHomeScreen(),
        "/ManagerReportPage": (context) => ManagerReportPage(),
        "/ManagerLoginScreen": (context) => ManagerLoginScreen(),
        "/ChangeMenuPage": (context) => ChangeMenuPage(),
        "/WaiterLoginScreen": (context) => WaiterLoginScreen(),
        "/MenuPage": (context) => MenuScreen(),
        "/SettingsPage": (context) => SettingsPage(),
        //"/MyOrderPage": (context) => MyOrderPage(),
        "/PayBillPage": (context) => PayBillPage(),
        "/ManagersChoicePage": (context) => ManagersChoicePage(),
        // "/FreeDessertPage": (context) => FreeDessertPage(),
        "/FreeDessertPage": (context) => SpinningWheel(),
        "/QRPage": (context) => QR(),
        "/GamesPage": (context) => GamesPage(),
        "/RequestRefillPage": (context) => RequestRefillPage(),
        "/SplitBillPage": (context) => SplitBillPage(),
      },
    );
  }
}
