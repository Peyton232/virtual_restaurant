library database;

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/billOrder.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final customerTableDatabaseReference = FirebaseDatabase.instance.reference().child('tables');//.push().child(path).set().asStream()
//reference
//https://medium.com/flutterdevs/explore-realtime-database-in-flutter-c5870c2b231f

//NOTE - make sure waiter deletes order form database when done, otherwise there could be possible overlap
//This should
Map<String, dynamic> toJson0(menuItem orderItem){
  return {
    'name': orderItem.name,
    'price': orderItem.price,//do not need for kitchen, useful for manager reports
  };
}

Map<String, dynamic> toJson(OrderItem item){
  return {
    'name': item.getItemName,
    'modifications': item.getModifications,
    'category': item.getItemCategory,
  };
}

/*
 * Change the format of the JSON hierarchy sent to tableOrderDB
 */
DatabaseReference sendData(List<menuItem> order) {
  var id = databaseReference.child('order/${globals.tableID}/');
  for (int i  = 0; i < order.length; i++) {
    id = databaseReference.child('order/${globals.tableID}/item${i+1}');
    id.set(toJson0(order[i]));
  }
  return id;
}

Future<String> readData() async {
  String result = (await FirebaseDatabase.instance.reference().child("fromPython/log/message").once()).value;
  print(result);
  //remove to and from python descriptors---------------------------------------------------------------------------------uncomment later
  //databaseReference.child('fromPython').remove();
  //databaseReference.child('toPython').remove();
  return(result);
}

DatabaseReference incrementTableCount(int tableNumber) {

  //FirebaseDatabase.instance.reference().remove()
}
Future<int> getTableNumber() async {
  int tableNumber = (await databaseReference.child('numberoftables').once()).value;
  incrementTableCount(tableNumber + 1);
  return tableNumber + 1;
}

DatabaseReference sendOrderToFirebase(Order orderToProcess) {
  String tableID = globals.thisDevicesTable.tableID;

  var id = customerTableDatabaseReference.child('$tableID/${orderToProcess.orderNumber}');
  id.child('isFinished').set(false).asStream();
  int i = 1;
  for(OrderItem item in orderToProcess.getOrderContents) {
    id.child('item$i').set(toJson(item));
    i++;
  }
return id;
}

/*
 * This is the *specific* order retrieval function. Pass in the table
 */

Future<Order> retrieveOrderFromDatabase(String tableIDtoFetch, int orderNumbertoFetch) {



  return null;
}
