import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:virtual_restaurant/Data/constants.dart';
//TODO: refactor MenuItem name to UpperCamelCase for types

class Item {
  String itemName;
  FoodCategory itemFoodCategory;
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

abstract class ModifyItem {
  String modifications;

  set makeModifications(String modInfo);
  String get getModifications;
}