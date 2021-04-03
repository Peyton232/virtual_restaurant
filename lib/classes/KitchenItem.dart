import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';
import 'JsonConversion.dart';


class KitchenItem extends Item with ModifyItem, JsonConversion{
  FoodCategory category;
  String name;
  String modifications;


  // AssetImage image;
  KitchenItem({
    this.category,
    this.name,
    this.modifications

  });

  @override
  String get getItemName => this.name;

  @override
  FoodCategory get getItemCategory => this.category;

  @override
  set makeModifications(String modInfo){
    modifications = modInfo;

  }

  @override
  String get getModifications => modifications;

  @override
  fromJson(Map<String, dynamic> json) {
    return KitchenItem(
      category : json.containsKey("category") ? json["category"] : -1,
      name : json.containsKey("name") ? json["name"] : -1,
      modifications : json.containsKey("modifications") ? json["modifications"] : -1,
    );
  }

  @override
  Map<String, dynamic> toJson(){
    return {
      "name": getItemName,
      "modifications": getModifications,
      "category": getItemCategory,
    };
  }

}

