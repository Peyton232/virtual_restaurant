import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class ManagersChoicePage extends StatefulWidget {
  @override
  _ManagersChoicePageState createState() => _ManagersChoicePageState();
}

class _ManagersChoicePageState extends State<ManagersChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager's Choice"),
      ),
    );
  }
}
