import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/FreeDessertPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GamesPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GuestHomeScreen.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/ManagersChoicePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/PayBillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SettingsPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerLoginScreen.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterLoginScreen.dart';
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
        "/ManagerLoginScreen": (context) => ManagerLoginScreen(),
        "/WaiterLoginScreen": (context) => WaiterLoginScreen(),
        "/MenuPage": (context) => MenuScreen(),
        "/SettingsPage": (context) => SettingsPage(),
        "/MyOrderPage": (context) => MyOrderPage(),
        "/PayBillPage": (context) => PayBillPage(),
        "/ManagersChoicePage": (context) => ManagersChoicePage(),
        "/FreeDessertPage": (context) => FreeDessertPage(),
        "/GamesPage": (context) => GamesPage(),
      },
    );
  }
}
