import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

class ManagerHomeScreen extends StatelessWidget {
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
          Row(
            children: <Widget>[
              CustomButton(
                label: "Waiter Mode",
                buttonTapped: () {
                  //Navigator.pushNamed(context, "/ManagersChoicePage");
                },
              ),
              CustomButton(
                label: "See Reports",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ManagerReportPage");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Change Meal of the Day",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ChangeMealOfDayPage");
                },
              ),
              CustomButton(
                label: "Change Menu",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ChangeMenuPage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
