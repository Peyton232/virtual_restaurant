import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';
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
                  loadMenuLists();
                  Navigator.pushNamed(context, "/ChangeMealOfDayPage");
                },
              ),
              CustomButton(
                label: "Change Avalibility Of Items",
                buttonTapped: () {
                  loadMenuLists();
                  Navigator.pushNamed(context, "/ChangeMenuPage");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Pick Table for Tablet",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/PickTablePage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
