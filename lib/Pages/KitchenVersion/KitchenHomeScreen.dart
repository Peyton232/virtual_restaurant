import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
//import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';



class KitchenHomeScreen extends StatefulWidget {
  // These two lines needed for firebase
  KitchenHomeScreen({this.app});
  final FirebaseApp app;
  // -----------------------------------
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {

  List<MenuItem> orders = [];

  Color changeIconColor = Colors.grey;

  MenuItem input;
  // using this to grab database information
  final referenceDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    // orders.add("item1");
    // orders.add("item2");
  }



  // Varibles
  final OrderNumber = 'OrderNumber';
  @override
  Widget build(BuildContext context) {

    bool _checked = false;

    final ref = referenceDatabase.reference();

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Todo"),
      ),

      body: ListView.builder(
        //Todo: Change this order.length later!!!! <- NICK LOOK AT ME
          itemCount: globals.order.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              //key: orders[index],
              background: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                ),
                  color: Colors.red,
              ),
              key: UniqueKey(),
              child: Card(
                color: Colors.white54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),

                child: CheckboxListTile(
                  title:  Text(
                    globals.order[index].name,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: Icon(
                    Icons.timer,
                  ),
                  //value: _checked,
                  value: globals.order[index].finished, // declared to false in menuItem class
                  onChanged: (bool selected){
                    setState(() {
                      globals.order[index].finished = selected;
                    });
                  },
                ),
                //child: Text("${globals.order[index].finished}"),
              ),
              onDismissed: (direction){
                setState(() {
                  // Todo: Implement a on dismissed for widget for deleting from orders list
                  //globals.order[index].removeAt(index);
                });
              },
            );
          }),
    );
  }
}