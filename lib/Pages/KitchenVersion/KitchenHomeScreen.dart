import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';


class KitchenHomeScreen extends StatefulWidget {
  // These two lines needed for firebase
    KitchenHomeScreen({this.app});
    final FirebaseApp app;
  // -----------------------------------
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {

  List orders = List();
  List identifier = List();
  Color changeIconColor = Colors.grey;
  String input = "";

  // using this to grab database information
  final referenceDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    orders.add("item1");
    orders.add("item2");
  }

  // Varibles
  final OrderNumber = 'OrderNumber';
  @override
  Widget build(BuildContext context) {

    final ref = referenceDatabase.reference();

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Todo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Add new order"),
                content: TextField(
                  onChanged: (String value){
                    input = value;
                  },
                ),
                actions: <Widget>[
                FlatButton(onPressed: (){
                  setState(() {
                    orders.add(input);
                  });
                  Navigator.of(context).pop(); // Closes the Alert Dialog Box
                } , child: Text("Add"))
                ],
              );
            }
          );
        },
      ),
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                //key: orders[index],
                key: UniqueKey(),
                child: Card(
                    color: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),

                    child: ListTile(
                      selected: true,
                      title: Text(orders[index]),
                      tileColor:  Colors.white54,
                     // selectedTileColor: Colors.green,
                      //focusColor: Colors.blue,

                      trailing: IconButton(
                         // highlightColor: Colors.orange,

                          icon: Icon(
                              Icons.timer,
                              color: changeIconColor,
                              // Icons.delete,
                              // color: Colors.red,
                          ),
                          onPressed: (){
                            setState(() {
                              changeIconColor = Colors.orange;

                            });
                          },
                          // onPressed: (){
                          //   setState(() {
                          //     orders.removeAt(index);
                          //   });
                          //}
                      ),
                    ),
                ),

            );
      }),
    );
  }
}
