import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';
import 'JsonConversion.dart';


class OrderItem extends Item with JsonConversion{
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
    return OrderItem(
        category : json.containsKey("category") ? json["category"] : -1,
        name : json.containsKey("name") ? json["name"] : -1,
        price : json.containsKey("price") ? json["price"] : -1

    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name" : getItemName,
      "price" : getItemPrice,
      "category" : getItemCategory,
    };
  }

}