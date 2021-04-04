import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';

//TODO: Add kidsMeals once they are fixed
List<MenuItem> Items = [...entrees, ...appetizers, ...sides, ...desserts, ...drinks];

class ItemsSoldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Text(
            "Items Sold",
            style: kAppBarTextStyle,
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: Items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 16,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${Items[index].getItemName}: ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '# Sold',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
