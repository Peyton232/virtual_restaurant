import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/Order.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
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

          OrderItem oneItem = OrderItem('Scrappy Burger',6.77, FoodCategory.Entree);
          Order newOrder;
          newOrder.addItem(oneItem);
          sendOrderToFirebase(newOrder);
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.red,
      ),
    );
  }
}
