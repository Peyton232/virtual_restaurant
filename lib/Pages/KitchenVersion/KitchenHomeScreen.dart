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

    @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
    .child('kitchen-orders')
    .orderByChild('order-id');
  }

  Widget _buildOrderItem({Map order}){
      return Container(
        margin: EdgeInsets.symmetric(vertical:10),
        padding: EdgeInsets.all(10),
        height: 150,
        color: Colors.white54,
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
                  "Order Number : ",
                    style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  order['order-id'].toString(),
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
                // Icon(
                //   Icons.add_alert_outlined,
                //   color: Colors.red,
                //   size: 20,
                // ),
                SizedBox(width: 30,),
                Text(
                  order['item1'].toString(),
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
    bool _checked = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Todo"),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map order = snapshot.value;
            return _buildOrderItem(order: order);
        } ,
        ),
      )
    );
  }
}
