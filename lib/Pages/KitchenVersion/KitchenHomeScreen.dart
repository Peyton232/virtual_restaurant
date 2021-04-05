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

  // Widget _buildOrderItem({List order, int index}) {
  //   var i = 0;
  //
  //   return Dismissible(
  //     background: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       color: Colors.red,
  //     ),
  //     key: UniqueKey(),
  //     child: Container(
  //
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //
  //         children: [
  //           Row(
  //             children: [
  //               // Icon(
  //               //   Icons.timer_outlined,
  //               //   color: Colors.red,
  //               //   size: 20,
  //               // ),
  //               SizedBox(width: 20,),
  //               Text(
  //                 "Table Number : ",
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color: Theme
  //                         .of(context)
  //                         .primaryColor,
  //                     fontWeight: FontWeight.w600
  //                 ),
  //               ),
  //               Text(
  //                 globals.itemsToOrder[index].table.toString(),
  //                 //"Hello",
  //                 style:
  //                 TextStyle(
  //                     fontSize: 20,
  //                     color: Theme
  //                         .of(context)
  //                         .primaryColor,
  //                     fontWeight: FontWeight.w600
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 10,),
  //           Row(
  //             children: [
  //               SizedBox(width: 20,),
  //               Container(
  //                 width: double.minPositive,
  //                 child: ListView.builder(
  //                     shrinkWrap: true,
  //
  //                     itemCount: rur[index].items.values
  //                             .toLibberDucky.length,
  //   //                     scrollDirection: Axis.horizontal,
  //   //                     itemBuilder: (BuildContext context, int i) {
  //   //                       return Text(
  //   //                         globals.itemsToOrdest()
  //                             .first[i]['name'].toString(),
  //                         style: TextStyle(
  //                             fontSize: 16,
  //                             color: Theme
  //                                 .of(context)
  //                                 .primaryColor,
  //                             fontWeight: FontWeight.w600
  //                         ),
  //                       );
  //                     }
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //     onDismissed: (direction) {
  //       setState(() {
  //
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    bool _checked = false;

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
              getWaiterInfo(); // grabbing data from database for orders
              return buildOrder(order: globals.itemsToOrder, index: index);
            },
          ),
        ));
  }

  Widget buildOrder({List order, int index}) {
    return Container(
      color: Colors.white,
      height: 350,
      child: ListView.builder(
          itemCount:
              globals.itemsToOrder[index].items.values.toList().first.length,
          itemBuilder: (BuildContext context, int i) {
            return Dismissible(
              key: UniqueKey(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Text(
                          globals.itemsToOrder[index].table.toString()
                        ),
                      ),
                    ],
                  ),
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
            );
          }),
    );
  }
}
