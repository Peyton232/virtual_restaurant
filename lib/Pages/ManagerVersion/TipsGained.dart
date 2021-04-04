import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

class employee {
  double daily_tips;
  String name;
  int id;

  employee(double tips, String n, int id) {
    this.daily_tips = tips;
    this.name = n;
    this.id = id;
  }
}

List<employee> Employees = [];

class TipsGained extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Employees.clear();
    Employees.add(employee(20.20, "Bruh", 0));
    Employees.add(employee(345.76, "Mary", 1));
    Employees.add(employee(3461, "Andy", 2));
    Employees.add(employee(3534.87, "Peyton", 3));
    Employees.add(employee(10.78, "David", 4));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Text(
            "Tips Gained",
            style: kAppBarTextStyle,
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: Employees.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 16,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${Employees[index].name}: ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '\$${Employees[index].daily_tips}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
