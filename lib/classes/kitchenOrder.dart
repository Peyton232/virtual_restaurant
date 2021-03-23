import 'package:flutter/cupertino.dart';
import 'package:virtual_restaurant/Data/constants.dart';

import 'order.dart';
import 'kitchenItem.dart';

class KitchenOrder extends Order with JsonConversion{

  int tableNumber;
  int orderNumber;
  bool isReady;
  List<KitchenItem> orderContents;

  KitchenOrder({
    @required int tableNumber,
    @required orderNumber,
    isReady : false,
  });

  //TODO: constructor from a Json/Map<String, dynamic> :: KitchenOrder.fromJson()

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

  @override
  fromJson(Map<String, dynamic> json) {
    //NOTE: This is an example and does not work... maybe
    //TODO: Michael get this fixed. This needs to work for the fromJson method below.
    return KitchenOrder(
      tableNumber : json.containsKey("tablenumber") ? json['tableNumber'] : null,
      orderNumber : json.containsKey('orderNumber'),
      isReady : json.containsKey('isReady'),

    );
    // TODO: implement fromJson
    throw UnimplementedError
    (
    );
  }



  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();

    return {

    };
  }
  
}