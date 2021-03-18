import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:virtual_restaurant/Data/constants.dart';
//TODO: refactor MenuItem name to UpperCamelCase for types

abstract class Item {
  String itemName;
  double price;
  FoodCategory itemFoodCategory;

  double get getItemPrice;
  String get getItemName;
  FoodCategory get getItemCategory;
}

class menuItem {
  String name;
  String allergens;//list
  bool available;
  String calories;//rounded int calories
  String description;
  String price;//float price

  AssetImage image;

  menuItem({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.calories,
    @required this.allergens,
    //TODO: @required this.image, image files for menu.
  });
}

mixin ModifyItem {
  String modifications;

  set makeModifications(String modInfo);
  String get getModifications;
}