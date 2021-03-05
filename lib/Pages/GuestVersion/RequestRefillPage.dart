import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class RequestRefillPage extends StatefulWidget {
  @override
  _RequestRefillPageState createState() => _RequestRefillPageState();
}

class _RequestRefillPageState extends State<RequestRefillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Drink Refills"),
      ),
    );
  }
}
