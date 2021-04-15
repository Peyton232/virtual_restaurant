/*
  This file will house the information for populating the screen
  of all the Kitchen Orders.
*/

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

class KitchenHomeScreen extends StatefulWidget {
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {

  // Referencing the database
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('kitchen-orders')
        .orderByChild('order-id');
  }

  @override
  Widget build(BuildContext context) {
    bool checkbox = false;
    bool _checkboxListTile = false;
    Color colorChanger = Colors.black87;

    return Scaffold(
        appBar: AppBar(
          title: Text("Orders Todo"),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              return buildOrder(
                  order: globals.itemsToOrder,
                  index: index,
                  checkbox: checkbox,
                  colorChanger: colorChanger);
            },
          ),
        ));
  }

  Widget buildOrder(
      {List order, int index, bool checkbox, Color colorChanger}) {
    return Container(
      color: Colors.white54,
      child: Container(
        color: Colors.green,
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dismissible(
              key: UniqueKey(),
              background: Card(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.check_box_rounded),
                    ],
                  ),
                ),
              ),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    child: Text(
                      globals.itemsToOrder[index].table.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: globals.itemsToOrder[index].items.values
                            .toList()
                            .first
                            .length,
                        itemBuilder: (BuildContext context, int i) {
                          return Dismissible(
                            key: UniqueKey(),
                            background: Card(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.delete),
                                  ],
                                ),
                              ),
                            ),
                            child: Container(
                              color: Colors.white54,
                              child: Text(
                                globals.itemsToOrder[index].items.values
                                    .toList()
                                    .first[i]['name']
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: colorChanger,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
