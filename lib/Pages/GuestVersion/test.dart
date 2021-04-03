import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:virtual_restaurant/classes/BillOrder.dart';
import 'package:virtual_restaurant/classes/KitchenOrder.dart';
import 'package:virtual_restaurant/classes/MenuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: const Center(child: Text("Press the button kronk!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*KitchenOrder newOrder = new Order.customNumber(100006);
          OrderItem oneItem = OrderItem('Scrappy Burger', 7.77, FoodCategory.Entree);
          OrderItem twoItem = OrderItem('Scrappy Balls', 6.69, FoodCategory.Appetizer);
          OrderItem threeItem = OrderItem('Scrappy Fingers', 9.77, FoodCategory.Entree);
          newOrder.addItem(oneItem);
          newOrder.addItem(twoItem);
          newOrder.addItem(threeItem);
          sendOrderToFirebase(newOrder);*/
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.red,
      ),
    );
  }
}
