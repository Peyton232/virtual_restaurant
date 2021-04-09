import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

//import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/classes/kitchenOrder.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';

class KitchenHomeScreen extends StatefulWidget {
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {
  // Referencing the database
  Query _ref;

  // making this a variable because I dont want to type alot

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
          // margin: EdgeInsets.symmetric(
          //   horizontal: 50,
          // ),
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

  Widget buildOrder({List order, int index, bool checkbox, Color colorChanger}) {
    return Container(
      color: Colors.white54,
      height: 150,
      child: Container(
        color: Colors.green,
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dismissible(
              key: UniqueKey(),
              child: Card(
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
            ),
            Expanded(
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
