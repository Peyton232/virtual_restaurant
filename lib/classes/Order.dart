import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';




class Order {
  int _orderNumber;
  List<OrderItem> _orderContents;
  double _orderTotal;

  Order() {
    _orderContents = [];
    _orderTotal = 0.0;
    //TODO: Get order number from Database or locally.
  }

  //Runs at O(n) since I do not want to account for list manipulation and identifying new items in the orderContents.
  //This should be used if unsure of the order's total.
  void _sumOrderTotal() {
    _orderTotal = 0.0;
    for( var item in _orderContents ) {
      _orderTotal += item.getItemPrice;
    }
  }

  int get getOrderNumber => this._orderNumber;

  //This is used to prevent corrupting the original orderContents List object
  List<OrderItem> get getOrderItem{
    return new List<OrderItem>.from(_orderContents);
  }

  void addItem(OrderItem passedOrderItem) {
    this._orderContents.add(passedOrderItem);
    this._orderTotal += passedOrderItem.getItemPrice;
  }
  //TODO: have solid plan as to how we should remove an item from an order. Just flat remove it at a location or should the list be organized in any fashion?
  void removeItem(int i){

  }
}






class OrderItem extends Item with ModifyItem {

  OrderItem(String passedName, double passedPrice, FoodCategory passedCategory){
    super.itemName = passedName;
    super.price = passedPrice;
    super.itemFoodCategory = passedCategory;
  }

  @override
  set makeModifications(String updateModInfo) => super.modifications = updateModInfo;

  //Retrieval of modifications made on an item the customer may make.
  @override
  String get getModifications => super.modifications;

  @override
  double get getItemPrice => super.price;

  @override
  String get getItemName => super.itemName;
}