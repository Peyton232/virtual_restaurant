import 'package:virtual_restaurant/classes/menuItem.dart';




class Order {

  List<menuItem> orderContents;
  double orderTotal;
}

class OrderItem extends Item with ModifyItem {


  OrderItem(String passedName, ){

  }

  @override
  String get getModifications => super.modifications;

  @override
  set makeModifications(String updateModInfo) => super.modifications = updateModInfo;

}