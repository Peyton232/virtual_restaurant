import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Database/database.dart';

class Table {
  int tableNumber;
  String listOfOrders;
  bool comped;
  bool paid;

  Table({
    @required this.tableNumber,
    @required this.comped,
    @required this.listOfOrders,
    @required this.paid,
  });
}

class WaiterHomeScreen extends StatefulWidget {
  @override
  _WaiterHomeScreenState createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
  List<Table> dummyData = [
    Table(
      tableNumber: 1,
      comped: false,
      listOfOrders: "(Add orders here)",
      paid: false,
    ),
    Table(
      tableNumber: 2,
      comped: false,
      listOfOrders: "(Add orders here)",
      paid: false,
    ),
    Table(
      tableNumber: 3,
      comped: false,
      listOfOrders: "(Add orders here)",
      paid: false,
    ),
    Table(
      tableNumber: 4,
      comped: false,
      listOfOrders: "(Add orders here)",
      paid: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiter Home Screen"),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushNamed(context, "/CustomerRequests");
                },
              ),
              //TODO: make ternary condition: no request - no dot, request - yes dot
              Positioned(
                // draw a red marble
                top: 13.0,
                right: 13.0,
                child: Icon(
                  Icons.brightness_1,
                  size: 10.0,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30,
            ),
            child: TableCard(
              tableNumber: dummyData[index].tableNumber,
              listOfOrders: dummyData[index].listOfOrders,
            ),
          );
        },
      ),
    );
  }
}

class TableCard extends StatefulWidget {
  int tableNumber;
  String listOfOrders;

  TableCard({this.tableNumber, this.listOfOrders});

  @override
  _TableCardState createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO: Display more information
      },
      style: ElevatedButton.styleFrom(
        primary: kOffWhite,
        elevation: 3.0,
        shadowColor: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.bookmark,
              size: 40,
              color: Colors.yellow[800],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Table ${widget.tableNumber}",
                    style: TextStyle(
                      color: kSemiBlack,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    "Orders: ${widget.listOfOrders}",
                    style: TextStyle(
                      color: kSemiBlack,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kLightGreen,
                  ),
                  onPressed: () {
                    //TODO: Comp functionality
                  },
                  child: Text(
                    "Comp",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kLightGreen,
                  ),
                  onPressed: () {
                    //TODO: Paid functionality
                  },
                  child: Text(
                    "Paid",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
