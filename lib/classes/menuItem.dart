import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';


class MenuItem extends Item {
  FoodCategory category;
  String name;
  List<String> allergens; //list
  bool available;
  int calories; //rounded int calories
  List<String> contents;
  String description;
  String price; //float price

  // AssetImage image;

  MenuItem({
    this.category,
    this.name,
    this.allergens,
    this.available,
    this.calories,
    this.contents,
    this.description,
    this.price,

    //TODO: @required this.image, image files for menu.
  });

  @override
  String get getItemName => this.name;

  @override
  FoodCategory get getItemCategory => this.category;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson menuItem
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson menuItem
    throw UnimplementedError();
  }
}