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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomButton(
                  icon: Icons.assignment_ind,
                  label: "Waiter Mode",
                  buttonTapped: () {
                    Navigator.pushNamed(context, "/WaiterHomeScreen");
                  },
                ),
                CustomButton(
                  icon: Icons.show_chart,
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
                  icon: Icons.restaurant_menu,
                  label: "Change Meal of the Day",
                  buttonTapped: () {
                    loadMenuLists();
                    Navigator.pushNamed(context, "/ChangeMealOfDayPage");
                  },
                ),
                CustomButton(
                  icon: Icons.menu_book,
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
                  icon: Icons.table_rows,
                  label: "Pick Table for Tablet",
                  buttonTapped: () {
                    Navigator.pushNamed(context, "/PickTablePage");
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
          ],
        ),
      ),
    );
  }
}
