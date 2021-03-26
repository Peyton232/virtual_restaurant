import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

class ManagerReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
            title: Text(
          "Reports",
          style: kAppBarTextStyle,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CustomButton(
                label: "Items Sold",
                buttonTapped: () {
                  //Navigator.pushNamed(context, "/ManagersChoicePage");
                },
              ),
              CustomButton(
                label: "Meals Comped",
                buttonTapped: () {
                  //Navigator.pushNamed(context, "/MenuPage");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Tips Gained",
                buttonTapped: () {
                  //Navigator.pushNamed(context, "/FreeDessertPage");
                },
              ),
              CustomButton(
                label: "View Revenue",
                buttonTapped: () {
                  //Navigator.pushNamed(context, "/GamesPage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
