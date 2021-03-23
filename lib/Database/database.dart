library database;

import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/material.dart';
import 'package:virtual_restaurant/classes/kitchenItem.dart';
import 'package:virtual_restaurant/classes/kitchenOrder.dart';
//import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
//import 'package:virtual_restaurant/classes/billOrder.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final customerTableDatabaseReference = FirebaseDatabase.instance.reference().child('tables');//.push().child(path).set().asStream()
final numberOfTablesRef = databaseReference.child('numberoftables');

//reference
//https://medium.com/flutterdevs/explore-realtime-database-in-flutter-c5870c2b231f

//TODO: Do away with these as it will be at the class level instead. That way every object defines their Json how it needs to be.
Map<String, dynamic> toJson(KitchenItem item){
  return {
    'name': item.getItemName,
    'modifications': item.getModifications,
    'category': item.getItemCategory,
  };
}

/*
 * Change the format of the JSON hierarchy sent to tableOrderDB
This is now a reference for new methods
DatabaseReference sendData(List<MenuItem> order) {
  var id = databaseReference.child('order/${globals.tableID}/');
  for (int i  = 0; i < order.length; i++) {
    id = databaseReference.child('order/${globals.tableID}/item${i+1}');
    id.set(toJson0(order[i]));
  }
  return id;
}
*/
//TODO: Remove.
Future<String> readData() async {
  String result = (await FirebaseDatabase.instance.reference().child("fromPython/log/message").once()).value;
  print(result);
  //remove to and from python descriptors---------------------------------------------------------------------------------uncomment later
  //databaseReference.child('fromPython').remove();
  //databaseReference.child('toPython').remove();
  return(result);
}

/*
 *  Currently, this method is not safe and may try to set values over 20. Firebase Rules should catch this,
 *  but it should be something to be aware of in the case of undefined behavior.
 */
Future<int> incrementTableCount(int newTableNumber) async {
  numberOfTablesRef.set(newTableNumber);
  return newTableNumber;
}
/*
 *  Currently, this method is not safe as it calls the above incrementTableCount method which is not safe.
 *  Hopefully there won't be more than 20 devices acting as tables attempting to connect... in which case an
 *  error *should* be thrown, but it hasn't been tested yet.
 *  TODO: Test this method for safety and max number of tables.
 */
Future<int> getTableNumber() async {
  int tableNumber = (await numberOfTablesRef.once()).value;
  return incrementTableCount(tableNumber+1);//This is intentional so that we wait until the table number is set in the DB before setting it locally. That way, both sides are on the same page.
}

DatabaseReference sendOrderToFirebase(KitchenOrder orderToProcess) {
  String tableID = globals.thisDevicesTable.tableID;//TODO: Change according to Michael's changes

  var id = customerTableDatabaseReference.child('$tableID/${orderToProcess.orderNumber}');
  id.child('isFinished').set(false).asStream();
  int i = 1;
  for(KitchenItem item in orderToProcess.getOrderContents) {
    id.child('item$i').set(toJson(item));
    i++;
  }
return id;
}

/*
 * This is the *specific* order retrieval function. Pass in the table
 */

Future<KitchenOrder> retrieveOrderFromDatabase(String tableIDtoFetch, int orderNumbertoFetch) {



  return null;
}

/*
 *  This is intended to be used by listeners to grab orders for the kitchen
 *  it should only grab the new order that was added to a tables.{$table_id}.
 *  Super simple, it should only be focused on the nodes the kitchen is concerned with.
 *  Then, when a change occurs in the DB in the focused area, this function should be called.
 *  A DataSnapshot will have all of the information of what changed. The issue will be if this is triggered
 *  when the kitchen makes a change themselves.
 */

Future<KitchenOrder> onKitchenUpdate (DataSnapshot kSnapShot) async {
  KitchenOrder temp;
  temp.fromJson(kSnapShot.value);
  return temp;
}