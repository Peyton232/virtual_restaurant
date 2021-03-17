import 'dart:io';
import 'package:flutter/cupertino.dart';
//TODO: refactor MenuItem name to UpperCamelCase for types
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
    //@required this.image,
  });
}
