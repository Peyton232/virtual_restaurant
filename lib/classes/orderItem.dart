import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';


class OrderItem extends Item{
  FoodCategory category;
  String name;
  double price;

  OrderItem({
  this.category,
  this.name,
  this.price});

  OrderItem.clone(OrderItem objectToClone) {
    this.itemName = objectToClone.getItemName;
    this.price = objectToClone.price;
    this.itemFoodCategory = objectToClone.itemFoodCategory;

  }
  @override
  String get getItemName => this.name;

  @override
  FoodCategory get getItemCategory => this.category;

  double get getItemPrice => this.price;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}