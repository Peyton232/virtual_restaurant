import 'package:virtual_restaurant/Data/constants.dart';
import 'OrderItem.dart';
import 'Order.dart';
import 'JsonConversion.dart';

class BillOrder extends Order with JsonConversion{

  int tableNumber;
  int orderNumber;
  bool isReady;
  List<OrderItem> orderContents;
  double orderTotal;

  BillOrder({
    this.tableNumber,
    this.orderNumber,
    this.isReady,
    this.orderTotal,
    this.orderContents
  });

  BillOrder.newOrder(
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
  @override
  fromJson(Map<String, dynamic> json) {
    return BillOrder(
        tableNumber : json.containsKey("tableNumber") ? json["tableNumber"] : -1,
        orderNumber : json.containsKey("orderNumber") ? json["orderNumber"] : -1,
        isReady : json.containsKey("isReady"),
        orderTotal : json.containsKey("orderTotal") ? json["orderTotal"] : -1,
        orderContents: json.containsKey("orderContents") ? json["orderContents"]: -1

    );

  }

  Map<String, dynamic> toJson(){
    return {
      "orderNumber" : getOrderNumber,
      "tableNumber" : getTableNumber,
      "isReady" : isOrderReady,
      "orderTotal" : getPrice,
      "orderContents" : getOrderContents
    };
  }

  double get getPrice => this.orderTotal;

  List<OrderItem> get getOrderContents{
    return new List<OrderItem>.from(orderContents);
  }
//maybe this should return the location if add supports that?
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
        filteredOrderItemsList.add(new OrderItem.clone(orderContents[x]));
      }
    }

    return filteredOrderItemsList;
  }


}
