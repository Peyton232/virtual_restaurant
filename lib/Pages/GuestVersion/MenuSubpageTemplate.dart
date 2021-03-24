import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This is the file used to create all the menu items for each category. This will take in a list
of menu items from MenuPage.dart and the UI will be created using the class in MenuItem.dart
 */

class MenuSubpageTemplate extends StatelessWidget {
  final String menuCategory;
  //final List<Menu> listOfMenuItems;
  final List<MenuItem> listOfMenuItems;

  MenuSubpageTemplate({
    this.menuCategory,
    this.listOfMenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          menuCategory,
          style: kAppBarTextStyle,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyOrderPage(
                      orderID: "Order I-7845",
                      //TODO: Add order ID here
                      //TODO: Pass current list of order here
                    );
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.assignment,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    "View Order",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        //ListView.builder makes the UI for the menu items. The amount of items displayed in each category
        //will depend on the amount of items in the list
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfMenuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItemUI(//TODO: This will need to be changed to reflect Michael's changes.
              name: listOfMenuItems[index].getItemName,
              allergens: listOfMenuItems[index].getAllergens,
              calories: listOfMenuItems[index].getCalories,
              description: listOfMenuItems[index].getDescription,
              price: listOfMenuItems[index].getPrice,
            );
          },
        ),
      ),
    );
  }
}