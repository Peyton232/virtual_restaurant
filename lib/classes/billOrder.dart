import 'package:virtual_restaurant/Data/constants.dart';
import 'orderItem.dart';
import 'order.dart';

class BillOrder extends Order{

  int tableNumber;
  int orderNumber;
  bool isReady;
  List<OrderItem> orderContents;
  double orderTotal;

  BillOrder(
      this.orderNumber,
      this.tableNumber
      ) {
    orderContents = [];
    orderTotal = 0.0;
    isReady = false;
  }


  @override
  int get getOrderNumber => this.orderNumber;
  @override
  int get getTableNumber => this.tableNumber;
  @override
  bool get isOrderReady => this.isReady;
  @override
  set orderIsReady(bool ready){
    this.isReady = ready;
  }

  double get getPrice => this.orderTotal;

  List<OrderItem> get getOrderContents{
    return new List<OrderItem>.from(orderContents);
  }

  void addItem(OrderItem passedOrderItem) {
    this.orderContents.add(passedOrderItem);
    this.orderTotal += passedOrderItem.getItemPrice;
  }

  void removeItemAt(int index){
    this.orderTotal -= this.orderContents[index].getItemPrice;
    this.orderContents.removeAt(index);

  }


  /*
   *  This method creates and returns a list of OrderItem objects which
   *  have the same FoodCategory variable we are passing in as an argument
   *  to the method. This does not remove those items from the original List
   *  @returns: List<OrderItem>
   */
  List<OrderItem> getItemsOfCategoryFromOrder(FoodCategory categoryFilter) {
    List<OrderItem> filteredOrderItemsList = [];
    for(int x = 0; x < orderContents.length; x++ ) {
      if(orderContents[x].getItemCategory == categoryFilter) {
        filteredOrderItemsList.add(new OrderItem.clone(orderContents[x]);
      }
    }

    return filteredOrderItemsList;
  }


}
