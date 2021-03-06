import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';
import 'JsonConversion.dart';

class MenuItem extends Item with JsonConversion {
  FoodCategory category;
  String name;
  List<String> allergens; //list
  bool available;
  int calories; //rounded int calories
  List<String> contents;
  String description;
  String price; //float price
  bool finished;
  String specialInstructs;
  String image;



  // AssetImage image;

  MenuItem({
    this.image,
    this.category,
    this.name,
    this.allergens,
    this.available,
    this.calories,
    this.contents,
    this.description,
    this.price,
    this.specialInstructs,

    this.finished = false,


    //TODO: @required this.image, image files for menu.
  });

  @override
  String get getItemName => this.name;

  String get getImageStr => this.image;

  @override
  FoodCategory get getItemCategory => this.category;

  List<String> get getAllergens => this.allergens;

  bool get isAvailable => this.isAvailable;

  int get getCalories => this.calories;

  List<String> get getContents => this.contents;

  String get getDescription => this.description;

  String get getPrice => this.price;


  bool get getFinished => this.finished;


  @override
  fromJson(Map<String, dynamic> json) {
    return MenuItem(
        category: json.containsKey("category") ? json["category"] : -1,
        name: json.containsKey("name") ? json["name"] : -1,
        allergens: json.containsKey("allergens") ? json["allergens"] : -1,
        available: json.containsKey("available") ? json["available"] : -1,
        calories: json.containsKey("calories") ? json["calories"] : -1,
        contents: json.containsKey("contents") ? json["contents"] : -1,
        description: json.containsKey("description") ? json["description"] : -1,
        price: json.containsKey("price") ? json["price"] : -1,
        finished: json.containsKey("finished") ? json["finished"] : -1,

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "name" : getItemName,
      "category" : getItemCategory,
      "allergens" : getAllergens,
      "available" : isAvailable,
      "calories" : getCalories,
      "contents" : getContents,
      "description" : getDescription,
      "price" : getPrice,
      "finished" : getFinished,

    };
  }

  @override
  String toString() => this.name.toString()+' '+toStringFoodCategory(this.category);

}