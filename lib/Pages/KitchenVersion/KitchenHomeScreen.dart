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
    bool _checked = false;

    return Scaffold(
        appBar: AppBar(
          title: Text("Orders Todo"),
        ),
        body: Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 50,
          // ),
          height: double.infinity,
          child: ListView.builder(
            itemCount: globals.itemsToOrder.length,
              itemBuilder: (BuildContext context, int index){
                return buildOrder(order: globals.itemsToOrder, index: index);
              })
        ));
  }

  Widget buildOrder({List order, int index}) {
    return Container(
      color: Colors.white,
      height: 150,

      child: Container(
        margin: EdgeInsets.all(10.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                globals.itemsToOrder[index].table.toString()
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      globals.itemsToOrder[index].items.values.toList().first.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     Container(
                          //       color: Colors.grey,
                          //       child: Text(
                          //         //globals.itemsToOrder[index].table.toString()
                          //         "testing it"
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Container(
                                color: Colors.grey,
                                child: Text(
                                  globals.itemsToOrder[index].items.values
                                      .toList()
                                      .first[i]['name']
                                      .toString(),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      onDismissed: (direction){
                        setState(() {

                        });
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
