import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This is the page where the customer can split the bill amongst their party.
 */

class SplitBillPage extends StatefulWidget {
  @override
  _SplitBillPageState createState() => _SplitBillPageState();
}

class _SplitBillPageState extends State<SplitBillPage> {
  int _amountOfPeople = 0;
  double _splitBill = 10.26;

  int _addPeople(int newAmount) {
    newAmount++;
    return newAmount;
  }

  int _subPeople(int newAmount) {
    newAmount--;
    return newAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Split Bill"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "How Many People:  ",
                  style: TextStyle(fontSize: 30.0),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _amountOfPeople = _addPeople(_amountOfPeople);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: kOffWhite,
                      size: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                  ),
                  child: Text(
                    "$_amountOfPeople",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_amountOfPeople > 0) {
                        _amountOfPeople = _subPeople(_amountOfPeople);
                      } else {}
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: kOffWhite,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Each one will pay: \$$_splitBill",
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
