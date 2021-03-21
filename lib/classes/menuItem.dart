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
  double price; //float price

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

  List<String> get getAllergens => this.allergens;
  bool get isAvailable => this.isAvailable;
  int get getCalories => this.calories;
  List<String> get getContents => this.contents;
  String get getDescription => this.description;
  double get getPrice => this.price;


}