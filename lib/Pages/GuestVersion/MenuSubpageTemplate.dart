import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/MenuClass.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';

class MenuSubpageTemplate extends StatelessWidget {
  final String menuCategory;
  //final List<Menu> listOfMenuItems;
  final List<menuItem> listOfMenuItems;

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
              Navigator.pushNamed(context, "/MyOrderPage");
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
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfMenuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItem(
              name: listOfMenuItems[index].name,
              //allergens: listOfMenuItems[index].allergens,
              calories: int.parse(listOfMenuItems[index].calories),
              description: listOfMenuItems[index].description,
              price: listOfMenuItems[index].price,
            );
          },
        ),
      ),
    );
  }
}
