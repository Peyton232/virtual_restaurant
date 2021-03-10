import 'dart:io';
import 'package:flutter/cupertino.dart';

class menuItem {
  String name;
  String description;
  String price;
  String calories;
  String allergens;
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
