/*
   This page shows all of the notifications for the requests
   from the table's. The information is pulled from the database
   and displayed here.
*/

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

const kRequestTextStyle = TextStyle(fontSize: 30);

class CustomerRequests extends StatefulWidget {
  @override
  _CustomerRequestsState createState() => _CustomerRequestsState();
}

class _CustomerRequestsState extends State<CustomerRequests> {
  List<String> dummyData = [
    "Table 1: Drink Refill for <item>, <item>",
    "Table 2: Come for assistance",
    "Table 3: Drink Refill for <item>, <item>",
    "Table 4: Drink Refill for <item>, <item>",
  ];

  // Referencing the database
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
        .child('waiterOrders');
  }

  Widget _buildOrderItem({Map order}){
    return Dismissible(

      background: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.red,
      ),
      key: UniqueKey(),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(width: 10,),
              Text(
                "Table Number : ",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                order['Table'].toString(),
                style:
                TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text(
                order['Request'].toString(),
                style:
                TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Requests"),
      ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
              Map order = snapshot.value;
              return _buildOrderItem(order: order);
            },
          ),
        )
    );
  }
}
