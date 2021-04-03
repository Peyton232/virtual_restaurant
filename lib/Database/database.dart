library database;

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/CustomerTable.dart';
import 'package:virtual_restaurant/classes/KitchenItem.dart';
import 'package:virtual_restaurant/classes/KitchenOrder.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/MenuItem.dart';
//import 'package:virtual_restaurant/classes/BillOrder.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final customerTableDatabaseReference = FirebaseDatabase.instance
    .reference()
    .child('tables'); //.push().child(path).set().asStream()
final menuDatabaseReference =
FirebaseDatabase.instance.reference().child('menu');
final numberOfTablesRef = databaseReference.child('numberoftables');

//reference
//https://medium.com/flutterdevs/explore-realtime-database-in-flutter-c5870c2b231f

//Future<void> async
DatabaseReference sendOrderToFirebase(KitchenOrder orderToProcess, CustomerTable table) {
  int tableNumber = table.getTableNumber; //TODO: Change according to Michael's changes

  var id = customerTableDatabaseReference
      .child('$tableNumber/${orderToProcess.orderNumber}');
  id.child('isFinished').set(false).asStream();
  int i = 1;
  for (KitchenItem item in orderToProcess.getContents) {
    id.child('item$i').set(orderToProcess.getContents[i].toJson());
    i++;
  }
  return id;
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
//TODO: Check with Andrew
Future<KitchenOrder> onKitchenUpdate(DataSnapshot kSnapShot) async {
  KitchenOrder temp;
  temp.fromJson(kSnapShot.value);
  return temp;
}

/* TODO: Complete the getMenuUpdate method
 * This function is to be called by a listener so as to update the menu listing
 * in a flexible fashion
 */
Future<List<MenuItem>> getMenuUpdate() async {}

/*
 *  Usage: This function is called on initial Table setup to establish what is on the menu.
 *  This should be called early so that there is enough time for the application to fetch
 *  all of the information from Firebase.
 *
 *  Pass in the
 */

Future<List<MenuItem>> getMenuSection(String sectionName) async {
  List<Map<dynamic, dynamic>> mapList = [];
  List<MenuItem> menuList = [];
  await FirebaseDatabase.instance
      .reference()
      .child("menu/$sectionName")
      .once()
      .then((DataSnapshot snapshot) {
    //pulls titles in order and triples them
    //print(snapshot.value);
    //snapshot.value
    (Map<dynamic, dynamic>.from(snapshot.value)).forEach((key, values) {
      Map<dynamic, dynamic> json = values;
      //TODO: Clean up this mess. This was originally supposed to work with the fromJson function, however I haven't tried (new MenuItem()).fromJson(json);
      menuList.add(MenuItem(
          category: json["category"],
          name: key,
          allergens: List<String>.from(json["allergens"]),
          available: json["available"],
          calories: json["calories"],
          contents: json["contents"],
          description: json["description"],
          price: json["price"].toString()));
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
  temporaryList = await getMenuSection("KidsMeals");
  globals.kidsMeals = temporaryList;
  temporaryList = await getMenuSection("Sides");
  globals.sides = temporaryList;
}
