import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

const kRequestTextStyle = TextStyle(fontSize: 30);

class CustomerRequests extends StatefulWidget {
  @override
  _CustomerRequestsState createState() => _CustomerRequestsState();
}

class _CustomerRequestsState extends State<CustomerRequests> {
  List<String> dummyData = [
    "Table 1: Drink Refill for <item>, <item>",
    "Table 2: Come for assistance",
    "Table 3: Drink Refill for <item>, <item>",
    "Table 4: Drink Refill for <item>, <item>",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Requests"),
      ),
      body: ListView.separated(
        itemCount: dummyData.length,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            child: ListTile(
              leading: Icon(
                Icons.error,
                size: 30,
                color: Colors.red,
              ),
              title: Text(
                '${dummyData[index]}',
                style: kRequestTextStyle,
              ),
            ),
            background: Container(
              color: kLightGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.check),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            key: ValueKey<String>(dummyData[index]),
            // onDismissed: (DismissDirection direction) {
            //   setState(() {
            //     dummyData.remove(index);
            //   });
            // },
          );
        },
      ),
    );
  }
}
