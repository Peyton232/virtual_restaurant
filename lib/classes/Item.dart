import 'package:virtual_restaurant/Data/constants.dart';


abstract class Item with JsonConversion{
  String itemName;
  FoodCategory itemFoodCategory;

  String get getItemName;
  FoodCategory get getItemCategory;

}

mixin ModifyItem {
  String modifications;

  set makeModifications(String modInfo);
  String get getModifications;
}