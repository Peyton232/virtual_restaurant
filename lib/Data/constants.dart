import 'package:flutter/material.dart';

//Colors used throughout the application
const kDarkGreen = Color(0xff054a29);
const kSemiDarkGreen = Color(0xff137547);
const kGreen = Color(0xff2a9134);
const kSemiLightGreen = Color(0xff3fa34d);
const kLightGreen = Color(0xff5bba6f);
const kMintGreen = Color(0xff95d5b2);
const kOffWhite = Color(0xfff5f5f5);
const kSemiBlack = Color(0xff121212);

//Welcome Screen Constants
const kLoginCardTextStyle = TextStyle(fontSize: 30.0, color: kSemiBlack);
const kAppBarTextStyle = TextStyle(fontSize: 25.0);
const kOrderColumnHeaderTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  color: kSemiBlack,
);

const kOrderDetailsTextStyle = TextStyle(fontSize: 30.0, color: kSemiBlack);

const kRowSpacing = 30.0;

//Database Constants
const FirebaseMenuDatabase = "https://virtual-restraurant-menu-database.firebaseio.com/";
const FirebaseOrdersDatabase = "https://virtual-restaurant-orders.firebaseio.com/";
const FirebaseEmployeeDatabase = "https://virtual-restaurant-employee-database.firebaseio.com/";