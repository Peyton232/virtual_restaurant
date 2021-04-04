import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

class ManagerReportPage extends StatelessWidget {
  double revenue = 2352435.34;

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
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text('Total Revenue:     \$${revenue}', style: TextStyle(fontSize: 30),),
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Items Sold",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ItemsSoldPage");
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
                  Navigator.pushNamed(context, "/TipsGained");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
