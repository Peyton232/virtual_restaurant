/*
  This screen will show the current orders
  the waiter can swipe away and show that the order is comped / paid
*/

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:virtual_restaurant/Database/database.dart';

class Table {
  Map tableNumber;
  String listOfOrders;
  bool comped;
  bool paid;

  // int index;

  Table({
    @required this.tableNumber,
    @required this.comped,
    @required this.listOfOrders,
    @required this.paid,

  });
}

class WaiterHomeScreen extends StatefulWidget {
  @override
  _WaiterHomeScreenState createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
  List order = globals.itemsToOrder;
  bool paidColorChanger = false;
  bool compColorChanger = false;

  // Referencing the database
  Query _ref;


  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('kitchen-orders');
  }

  @override
  Widget build(BuildContext context) {
    bool checkbox = false;
    bool _checkboxListTile = false;
    Color colorChanger = Colors.black87;

    return Scaffold(
        appBar: AppBar(
          title: Text("Current Orders"),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.pushNamed(context, "/CustomerRequests");
                  },
                ),
                Positioned(
                  top: 13.0,
                  right: 13.0,
                  child: Icon(
                    Icons.brightness_1,
                    size: 10.0,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ],
        ),

        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              //getFinishOrder(index);
              return
                  buildOrder(
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
      margin: EdgeInsets.all(10),
      child:
      Container(
        color: Colors.grey[300],
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
              Dismissible(
              onDismissed:(DismissDirection direction){
                deleteOrder(globals.itemsToOrder[index].table.toString());
              },
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

              key: UniqueKey(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 3,
                        child: Text(
                          //globals.itemsToOrder[index].table.toString(),
                          globals.itemsToOrder[index].table.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Row(
                        children: [

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kLightGreen,
                            ),
                            onPressed: () {
                              setState(() {
                                createCompedAlertDialog(context);
                              });
                              // TODO: Comp functionality
                            },
                            child: Text(
                              "Comp",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kLightGreen,
                            ),
                            onPressed: () {
                              setState(() {
                                createPaidAlertDialog(context);
                              });
                              // TODO: Paid functionality
                            },
                            child: Text(
                              "Paid",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),

                        ],
                      )
                    ],
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
                          return Container(
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

  createCompedAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Order has been Comped!"),
          content: Text("Please Swipe Order away after confirming."),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 18.0,
                  color: kSemiDarkGreen,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  createPaidAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Order has been Paid!"),
          content: Text("Please Swipe Order away after confirming."),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 18.0,
                  color: kSemiDarkGreen,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}