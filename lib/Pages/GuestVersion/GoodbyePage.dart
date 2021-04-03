import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class GoodbyePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () async {
      //   return false;
      // },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.credit_card,
                size: 60,
                color: kSemiDarkGreen,
              ),
              Text(
                "Your order has been paid.",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Thank you and come again!",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
