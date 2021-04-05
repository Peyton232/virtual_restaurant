import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart';

class PickTablePage extends StatefulWidget {
  @override
  _PickTablePageState createState() => _PickTablePageState();
}

class _PickTablePageState extends State<PickTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Table: ${tableID}'),
      ),
      body: Center(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.70,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    tableID = "T${index + 1}";
                  });
                  print(tableID);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "T${index + 1}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
