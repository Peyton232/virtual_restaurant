library database;

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/kitchenItem.dart';
import 'package:virtual_restaurant/classes/kitchenOrder.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/menuItem.dart';
//import 'package:virtual_restaurant/classes/billOrder.dart';
import 'dart:convert';

final databaseReference = FirebaseDatabase.instance.reference();
final customerTableDatabaseReference = FirebaseDatabase.instance.reference().child('tables');//.push().child(path).set().asStream()
final menuDatabaseReference = FirebaseDatabase.instance.reference().child('menu');
final numberOfTablesRef = databaseReference.child('numberoftables');
final mealOfDayRef = databaseReference.child('mealOfDay');

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

Map<String, dynamic> toJsonMenu(MenuItem item){
  return {
    'name': item.name,
    'description': item.description,
    'price': item.price,
    'allergens': item.allergens,
    'finished': item.finished,
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
*
*
*
*/
void changeMealOfDay() async {
  var id = databaseReference.child('mealOfDay/');
  id.set(toJsonMenu(globals.mealOFTheDay));
}

void getMealOfDay() async {
  String result = (await FirebaseDatabase.instance.reference().child("mealOfDay/name").once()).value;
  globals.mealOFTheDay.name = result;
  result = (await FirebaseDatabase.instance.reference().child("mealOfDay/price").once()).value;
  globals.mealOFTheDay.price = result;
  result = (await FirebaseDatabase.instance.reference().child("mealOfDay/description").once()).value;
  globals.mealOFTheDay.description = result;
  bool bResult = (await FirebaseDatabase.instance.reference().child("mealOfDay/finished").once()).value;
  globals.mealOFTheDay.finished = bResult;
  List<String> allergies = (await FirebaseDatabase.instance.reference().child("mealOfDay/allergens").once()).value;
  globals.mealOFTheDay.allergens = allergies;
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

Future<KitchenOrder> retrieveOrderFromDatabase(int orderNumbertoFetch) {



  return null;
}

/*
 *  This is intended to be used by listeners to grab orders for the kitchen
 *  it should only grab the new order that was added to a tables.{$table_id}.
 *  Super simple, it should only be focused on the nodes the kitchen is concerned with.
 *  Then, when a change occurs in the DB in the focused area, this function should be called.
 *  A DataSnapshot will have all of the information of what changed. The issue will be if this is triggered
 *  when the kitchen makes a change themselves.
 *
 * Use with .onChildAdded
 */

Future<KitchenOrder> onKitchenUpdate (DataSnapshot kSnapShot) async {
  KitchenOrder temp;
  temp.fromJson(kSnapShot.value);
  return temp;
}

/* TODO: Complete the getMenuUpdate method
 * This function is to be called by a listener so as to update the menu listing
 * in a flexible fashion
 */
Future<List<MenuItem>> getMenuUpdate () async {

}

/*
 *  Usage: This function is called on initial Table setup to establish what is on the menu.
 *  This should be called early so that there is enough time for the application to fetch
 *  all of the information from Firebase.
 *
 *  Pass in the
 */


Future<List<MenuItem>> getMenuSection (String sectionName) async {
  List<Map<dynamic, dynamic>> mapList = [];
  List<MenuItem> menuList = [];
  await FirebaseDatabase.instance
      .reference()
      .child("menu/$sectionName")
      .once()
      .then((DataSnapshot snapshot){
    //pulls titles in order and triples them
    //print(snapshot.value);
    //snapshot.value
    (Map<dynamic, dynamic>.from(snapshot.value)).forEach((key,values) {
      Map<dynamic, dynamic> json = values;
      //TODO: Clean up this mess. This was originally supposed to work with the fromJson function, however I haven't tried (new MenuItem()).fromJson(json);
      menuList.add(MenuItem(
      category:toFoodCategoryFromString(sectionName),
      name:key,
      allergens:List<String>.from(json["allergens"]),
      available:json["available"],
      calories:json["calories"],
      contents:json["contents"],
      description:json["description"],
      price:json["price"].toString()
      ));
    });
  });
  return menuList;
}

/*
 * This initializes the MenuItem Lists in globals for use with the MenuSubpageTemplate Widget
 */
void loadMenuLists() async {

  var temporaryList = await getMenuSection("Appetizers");
  globals.appetizers = temporaryList;
  temporaryList = await getMenuSection("Desserts");
  globals.desserts = temporaryList;
  temporaryList = await getMenuSection("Drinks");
  globals.drinks = temporaryList;
  temporaryList = await getMenuSection("Entrees");
  globals.entrees = temporaryList;
  //TODO: Fix async issue with iterator in getMenuSection using "KidsMeals"
  //temporaryList = await getMenuSection("KidsMeals");
  //globals.kidsMeals = temporaryList;
  temporaryList = await getMenuSection("Sides");
  globals.sides = temporaryList;

  //get meal of day
  getMealOfDay();

}


void sendWaiterRequest(){
  var id = databaseReference.child('waiterOrders/${globals.tableID}/');
  id.set('table requests assistance');
}

void requestRefill() {
  var id = databaseReference.child('waiterOrders/${globals.tableID}/');
  id.set('table needs refills');
  Map<String, dynamic> orderItemToJson(MenuItem order) {
    return {
      'name': order.name,
      'price': order.price,
    };
  }

  DatabaseReference sendData() {
    var id = databaseReference.child('kitchen-orders/${globals.tableID}/');
    List<Map<String, dynamic>> completeOrder = List<
        Map<String, dynamic>>.filled(
        globals.order.length, new Map<String, dynamic>());
    for (int i = 0; i < globals.order.length; i++) {
      completeOrder[i] = orderItemToJson(globals.order[i]);
    }
    id.push().set(completeOrder);
    return id;
  }
}

Map<String, dynamic> orderItemToJson(MenuItem order) {
  return{
    'name': order.name,
    'price': order.price,
    'category': order.category,
    'available': order.available,
    'finished': order.finished,
  };
}

DatabaseReference sendData() {
  var id = databaseReference.child('kitchen-orders/${globals.tableID}/');
  List<Map<String, dynamic>> completeOrder = List<Map<String, dynamic>>.filled(globals.order.length, new Map<String, dynamic>());
  for (int i = 0; i < globals.order.length; i++) {
    completeOrder[i] = orderItemToJson(globals.order[i]);
  }
  id.push().set(completeOrder);
  return id;
}

// Future<List<String>> getWaiterInfo() async{
//
//   // List<Map<String, dynamic>> temp = List<Map<String, dynamic>>.filled(50, new Map<String, dynamic>());;
//   // Map<dynamic, dynamic> data;
//   // //List<Map<String, dynamic>> temp = [];
//   // int i = 0;
//
//   var id = databaseReference.child('kitchen-orders/');
//   print(id.once);
//     id.once().then((DataSnapshot snapshot){
//       (new Map<String, dynamic>.from(snapshot.value)).forEach((key,values) {
//         Map<dynamic, dynamic> json = values;
//         print(json);
//
//       });
//   });
//
//
//     // for(int i = 0 ; i < 2; i++){
//     //   print(temp[i].keys);
//     // }
//
//     //globals.itemsToOrder;
//
// }


void getWaiterInfo() async{

  var id = databaseReference.child('kitchen-orders/');
  id.once().then((DataSnapshot snapshot){
    (new Map<String, dynamic>.from(snapshot.value)).forEach((key,values) {
      Map<dynamic, dynamic> json = values;
        //add key to orderItems
        globals.itemsToOrder.add(
          new globals.orderItems(
            table: key,
            items: json,
          )
        );
    });
  });
  await new Future.delayed(const Duration(seconds : 1));

  // print(globals.itemsToOrder[0].table);
  // print(globals.itemsToOrder[0].items);
  // print(globals.itemsToOrder[1].table);
  // print(globals.itemsToOrder[1].items);

}