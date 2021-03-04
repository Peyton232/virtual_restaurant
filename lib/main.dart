import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GuestHomeScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerLoginScreen.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterLoginScreen.dart';
import 'Pages/welcomeScreen.dart';
import 'Data/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(buttonColor: kOffWhite),
      title: 'Virtual Restaurant',
      initialRoute: "/WelcomeScreen",
      routes: {
        "/WelcomeScreen": (context) => WelcomePage(),
        "/GuestHomeScreen": (context) => GuestHomeScreen(),
        "/ManagerLoginScreen": (context) => ManagerLoginScreen(),
        "/WaiterLoginScreen": (context) => WaiterLoginScreen(),
      },
    );
  }
}
