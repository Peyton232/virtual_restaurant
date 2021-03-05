import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
      ),
    );
  }
}
