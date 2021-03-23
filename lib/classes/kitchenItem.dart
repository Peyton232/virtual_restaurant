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
    // TODO: implement fromJson kitchenItem
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson kitchenItem
    throw UnimplementedError();
  }

}

