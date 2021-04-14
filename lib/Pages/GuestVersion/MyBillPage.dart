import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/classes/menuItem.dart';

/*
This is the page where the customer can view their bill and pay.
They have the option to give a tip and split the bill between people
 */

class MyBillPage extends StatefulWidget {
  @override
  _MyBillPageState createState() => _MyBillPageState();
}

class _MyBillPageState extends State<MyBillPage> {
  TextEditingController _tipController;
  double _tipAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _tipController = TextEditingController();
  }

  @override
  void dispose() {
    _tipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "My Bill",
          style: kAppBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            globals.order.isEmpty ? _NoOrder() : _header(),
            Expanded(
              flex: 3,
              child: Container(
                //Displays a list of added order
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: globals.order.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0,
                      color: kOffWhite,
                      margin: EdgeInsets.symmetric(
                        horizontal: 100.0,
                        vertical: 10.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: 200,
                              child: Text(
                                globals.order[index].name,
                                style: kOrderInfoTextStyle,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              width: 90.0,
                            ),
                            Text(
                              globals.order[index].price,
                              style: kOrderInfoTextStyle,
                            ),
                            //TODO: Can be enabled for waiter
                            // IconButton(
                            //   onPressed: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (context) {
                            //         return AlertDialog(
                            //           title: Text(
                            //               "Are you sure you want to delete ${globals.order[index].name}?"),
                            //           actions: <Widget>[
                            //             MaterialButton(
                            //               elevation: 5.0,
                            //               child: Text(
                            //                 'Yes',
                            //                 style: TextStyle(
                            //                   fontSize: 18.0,
                            //                   color: Colors.red,
                            //                 ),
                            //               ),
                            //               onPressed: () {
                            //                 //TODO: remove item from list
                            //               },
                            //             ),
                            //             MaterialButton(
                            //               elevation: 5.0,
                            //               child: Text(
                            //                 'No',
                            //                 style: TextStyle(
                            //                   fontSize: 18.0,
                            //                   color: kSemiDarkGreen,
                            //                 ),
                            //               ),
                            //               onPressed: () {
                            //                 Navigator.pop(context);
                            //               },
                            //             ),
                            //           ],
                            //         );
                            //       },
                            //     );
                            //   },
                            //   icon: Icon(
                            //     Icons.delete,
                            //     color: Colors.red,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: globals.order.isEmpty ? 80.0 : 180.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Tip:",
                    style: kOrderDetailsTextStyle,
                  ),
                  SizedBox(
                    width: 55.0,
                  ),
                  Text(
                    "\$ ${globals.tip.toStringAsFixed(2)}", //Made total only display two decimal places
                    style: kOrderDetailsTextStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                    onPressed: () {
                      createAlertDialog(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: globals.order.isEmpty ? 130.0 : 230.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Tax: ",
                    style: kOrderDetailsTextStyle,
                  ),
                  SizedBox(
                    width: 47.0,
                  ),
                  Text(
                    "\$ ${getTax(getTotal(globals.order)).toStringAsFixed(2)}", //Made total only display two decimal places
                    style: kOrderDetailsTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: globals.order.isEmpty ? 130.0 : 230.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Total: ",
                    style: kOrderDetailsTextStyle,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "\$ ${getTotalWithTip(getTotal(globals.order)).toStringAsFixed(2)}", //Made total only display two decimal places
                    style: kOrderDetailsTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(
                height: 1.0,
                endIndent: 50.0,
                indent: 50.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kGreen,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/SplitBillPage");
                  },
                  child: Container(
                    height: 70.0,
                    width: 250.0,
                    child: Center(
                      child: Text(
                        "Split Bill",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kGreen,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/CheckoutPage");
                  },
                  child: Container(
                    height: 70.0,
                    width: 250.0,
                    child: Center(
                      child: Text(
                        "Pay Bill",
                        style: TextStyle(fontSize: 30.0),
                      ),
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

  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(
            right: 115.0,
          ),
          title: Text("How much would you like to tip?"),
          actions: <Widget>[
            Column(
              children: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "10\%",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kSemiDarkGreen,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      globals.tip = globals.total * .10;
                    });
                    Navigator.pop(context);
                  },
                ),
                MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "15\%",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kSemiDarkGreen,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      globals.tip = globals.total * .15;
                    });
                    Navigator.pop(context);
                  },
                ),
                MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "20\%",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kSemiDarkGreen,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      globals.tip = globals.total * .20;
                    });
                    Navigator.pop(context);
                  },
                ),
                MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "Custom",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kSemiDarkGreen,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    tipTextBox();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  tipTextBox() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Tip: "),
          content: TextField(
            onSubmitted: (String value) {
              setState(() {
                globals.tip = double.parse(value);
              });
              Navigator.pop(context);
            },
            controller: _tipController,
          ),
          actions: <Widget>[],
        );
      },
    );
  }

  Widget _header() {
    return Card(
      color: kOffWhite,
      elevation: 0,
      margin: EdgeInsets.only(
        left: 213.0,
        right: 210.0,
        top: 5.0,
        bottom: 5.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Items:",
              style: kOrderHeaderTextStyle,
            ),
            Text(
              "Price:",
              style: kOrderHeaderTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _NoOrder() {
    return Expanded(
      child: Center(
        child: Text(
          "No Orders Added Yet",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
  //TODO:  Implement 10%, 15%, 20% tip functions for the total

//helper functions
  double getTotal(List<MenuItem> order) {
    globals.total = 0;
    //parse through and get total
    for (int i = 0; i < order.length; i++) {
      globals.total += double.parse(order[i].price);
    }

    return globals.total;
  }

  double getTotalWithTip(double total) {
    double totalWithTip = 0.0;
    totalWithTip = globals.total + globals.tip + getTax(total);
    return totalWithTip;
  }

  double getTax(double total) {
    double taxAmount = 0.0;
    taxAmount = total * .0825;
    return taxAmount;
  }
}
