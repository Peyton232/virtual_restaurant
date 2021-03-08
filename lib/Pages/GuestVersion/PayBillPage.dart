import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

//TODO: Make UI better later. Too lazy right now :(

class PayBillPage extends StatefulWidget {
  @override
  _PayBillPageState createState() => _PayBillPageState();
}

class _PayBillPageState extends State<PayBillPage> {
  double _tipAmount = 0.00;

  double _addTipAmount(double newAmount) {
    newAmount++;
    return newAmount;
  }

  double _subTipAmount(double _tipAmount) {
    _tipAmount--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Bill"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //Items Column => Convert to ListView
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Items: ",
                                    style: kOrderColumnHeaderTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "Coca Cola",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "Caesar Salad",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "Rib-Eye Steak",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Quantity Column => Convert to ListView
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Qty: ",
                                    style: kOrderColumnHeaderTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "1",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "2",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "1",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Price Column => Convert to ListView
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Price: ",
                                    style: kOrderColumnHeaderTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "\$ 1.79",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "\$ 7.49",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kRowSpacing),
                                    child: Text(
                                      "\$ 29.02",
                                      style: kOrderDetailsTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tax: ",
                          style: kOrderDetailsTextStyle,
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "\$1.27",
                          style: kOrderDetailsTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Total: ",
                          style: kOrderDetailsTextStyle,
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "\$43.57",
                          style: kOrderDetailsTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tip:",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          width: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.grey[500],
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter amount',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kGreen,
                  ),
                  onPressed: () {},
                  child: Container(
                    height: 100.0,
                    width: 300.0,
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
                  onPressed: () {},
                  child: Container(
                    height: 100.0,
                    width: 300.0,
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
}
