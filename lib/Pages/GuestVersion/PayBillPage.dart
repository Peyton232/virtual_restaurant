import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class PayBillPage extends StatefulWidget {
  @override
  _PayBillPageState createState() => _PayBillPageState();
}

class _PayBillPageState extends State<PayBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Bill"),
      ),
    );
  }
}
