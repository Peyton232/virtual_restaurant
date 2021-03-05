import 'package:flutter/material.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/MenuClass.dart';

class MenuSubpageTemplate extends StatelessWidget {
  final String menuCategory;
  final List<Menu> listOfMenuItems;

  MenuSubpageTemplate({
    this.menuCategory,
    this.listOfMenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuCategory),
      ),
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfMenuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItem(
              name: listOfMenuItems[index].name,
              allergens: listOfMenuItems[index].allergens,
              calories: listOfMenuItems[index].calories,
              description: listOfMenuItems[index].description,
              price: listOfMenuItems[index].price,
            );
          },
        ),
      ),
    );
  }
}
