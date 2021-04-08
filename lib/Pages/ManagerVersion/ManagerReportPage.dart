import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/Database/database.dart';

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
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text(
              'Total Revenue:     \$${globals.totalRevenue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text(
              'Tips Gained:     \$${globals.tipsGained.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Text(
              'Items Comped:     ${globals.itemsComped}',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            children: <Widget>[
              CustomButton(
                icon: Icons.attach_money,
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
