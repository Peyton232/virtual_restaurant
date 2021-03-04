import 'package:flutter/material.dart';
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
      home: WelcomePage(),
    );
  }
}
