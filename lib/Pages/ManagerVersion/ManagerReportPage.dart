import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/Database/database.dart';

class ManagerReportPage extends StatelessWidget {
  double revenue = 2352435.34;

  @override
  Widget build(BuildContext context) {
    getReportsInfo();
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
            child: Text('Total Revenue:     \$${globals.totalRevenue}', style: TextStyle(fontSize: 30),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text('Tips Gained:     \$${globals.tipsGained}', style: TextStyle(fontSize: 30),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text('Items Comped:     ${globals.itemsComped}', style: TextStyle(fontSize: 30),),
          ),
          Row(
            children: <Widget>[
              CustomButton(
                label: "Items Sold",
                buttonTapped: () {
                  Navigator.pushNamed(context, "/ItemsSoldPage");
                },
              ),
        ],
    ),
    ],
      ),
    );
  }
}
