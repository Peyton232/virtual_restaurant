import 'package:virtual_restaurant/Data/constants.dart';
import 'Item.dart';


class KitchenItem extends Item with ModifyItem{
  FoodCategory category;
  String name;
  String modifications;


  // AssetImage image;

  KitchenItem({
   this.category,
   this.name,

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

}

