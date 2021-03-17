
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';


class KitchenHomeScreen extends StatefulWidget {
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {
  List orders = List();


  @override
  void initState() {
    super.initState();
    orders.add("item1");
    orders.add("item2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Todo"),
      ),
      body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                //key: orders[index],
                key: UniqueKey(),
                child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: ListTile(
                      title: Text(orders[index]),
                      trailing: IconButton(
                          icon: Icon(
                              Icons.delete, 
                              color: Colors.red
                          ), 
                          onPressed: (){
                            setState(() {
                              orders.removeAt(index);
                            });
                          }),
                    ),
            ));
          }),
    );
  }
}
