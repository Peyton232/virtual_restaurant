import 'order.dart';
import 'kitchenItem.dart';

class KitchenOrder extends Order{

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

  List<KitchenItem> get getOrderContents{
    return new List<KitchenItem>.from(orderContents);
  }
  
}