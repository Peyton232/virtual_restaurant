import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

final databaseReference = FirebaseDatabase.instance.reference();

//reference
//https://medium.com/flutterdevs/explore-realtime-database-in-flutter-c5870c2b231f

Map<String, dynamic> toJson(menuItem orderItem){
  return {
    'name': orderItem.name,
    'price': orderItem.price,
  };
}

DatabaseReference sendData(List<menuItem> order) {
  var id = databaseReference.child('order/${globals.tableID}/');
  for (int i  = 0; i < order.length; i++) {
    id = databaseReference.child('order/${globals.tableID}/item${i+1}');
    id.set(toJson(order[i]));
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