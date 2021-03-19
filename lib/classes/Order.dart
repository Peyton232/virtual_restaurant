import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';




class Order {
  int _orderNumber;
  List<OrderItem> _orderContents;
  double _orderTotal;
  bool _isReadyFromKitchen;

  Order() {
    _orderNumber = 100000;
    _orderContents = [];
    _orderTotal = 0.0;
    //TODO: Get order number from Database or locally.
    _isReadyFromKitchen = false;
  }

  //Runs at O(n) since I do not want to account for list manipulation and identifying new items in the orderContents.
  //This should be used if unsure of the order's total.
  void _sumOrderTotal() {
    _orderTotal = 0.0;
    for( var item in _orderContents ) {
      _orderTotal += item.getItemPrice;
    }
  }

  int get orderNumber => this._orderNumber;

  set orderNumber(int newOrderNum) {
    _orderNumber = newOrderNum;
  }
  /*
   *  This should be used to prevent corrupting the original orderContents List object.
   *  Currently, it is unclear as to whether or not Dart actually returns a reference or
   *  a new object with the List<>.from() function.
   */
  List<OrderItem> get getOrderContents{
    return new List<OrderItem>.from(_orderContents);
  }

  void addItem(OrderItem passedOrderItem) {
    this._orderContents.add(passedOrderItem);
    this._orderTotal += passedOrderItem.getItemPrice;
  }
  //Just flat remove it at a location or should the list be organized in any fashion?
  void removeItemAt(int index){
    this._orderContents.removeAt(index);
  }
  /*
   * Corporate Naming Convention awww yisss
   *  This method creates and returns a list of OrderItem objects which
   *  have the same FoodCategory variable we are passing in as an argument
   *  to the method. This does not remove those items from the original List<
   * @returns: List<OrderItem>
   */
  List<OrderItem> getItemsOfCategoryFromOrder(FoodCategory categoryFilter) {
    List<OrderItem> filteredOutOrderItemsList = [];
    for( OrderItem obj in this._orderContents ) {
      if(obj.itemFoodCategory == categoryFilter)
        filteredOutOrderItemsList.add(new OrderItem.clone(obj));
    }

    return filteredOutOrderItemsList;
  }


}





/*
 * OrderItem inherits from the abstract class Item and the mixin ModifyItem.
 * It is the item that are relevant to the kitchen, table, waiter, and
 * statistics for the manager. Only the menu and menu UI are concerned with
 */
class OrderItem extends Item with ModifyItem {

  OrderItem(String passedName, double passedPrice, FoodCategory passedCategory){
    this.itemName = passedName;
    this.price = passedPrice;
    this.itemFoodCategory = passedCategory;
  }

  /*
   * This is a copy method to perform a Deep Copy so we do not end up changing
   * the objects passed by reference.
   */
  OrderItem.clone(OrderItem objectToClone) {
    this.itemName = objectToClone.getItemName;
    this.price = objectToClone.price;
    this.itemFoodCategory = objectToClone.itemFoodCategory;
  }

  OrderItem.MenuItemClone(MenuItem MenuItemToClone){
    this.itemName = MenuItemToClone.name;
  }

  @override
  set makeModifications(String updateModInfo) => this.modifications = updateModInfo;

  //Retrieval of modifications made on an item the customer may make.
  @override
  String get getModifications => this.modifications;

  @override
  double get getItemPrice => super.price;

  @override
  String get getItemName => this.itemName;

  @override
  // TODO: implement getItemCategory
  FoodCategory get getItemCategory => this.itemFoodCategory;
}