import 'order.dart';
import 'kitchenItem.dart';
import 'JsonConversion.dart';

class KitchenOrder extends Order with JsonConversion{

  int tableNumber;
  int orderNumber;
  bool isReady;
  List<KitchenItem> orderContents;

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

  KitchenOrder({
    this.tableNumber,
    this.orderNumber,
    this.isReady,
    this.orderContents
});

  @override
  fromJson(Map<String, dynamic> json) {
    return KitchenOrder(
      tableNumber : json.containsKey("tableNumber") ? json["tableNumber"] : -1,
      orderNumber : json.containsKey("orderNumber") ? json["orderNumber"] : -1,
      isReady : json.containsKey("isReady"),
      orderContents : json.containsKey("contents") ? json["contents"] : -1
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "orderNumber": getOrderNumber,
      "tableNumber": getTableNumber,
      "isReady" : isOrderReady,
      "contents" : getOrderContents
    };
  }

  List<KitchenItem> get getOrderContents{
    return new List<KitchenItem>.from(orderContents);
  }

}