import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

enum DineOption {
  dineIn,
  toGo,
}

class MyOrderPage extends StatefulWidget {
  final String orderID;

  //TODO: Add list of current order

  MyOrderPage({this.orderID});

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  DineOption isSelected = DineOption.dineIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.orderID,
          style: kAppBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: globals.order.length,
                itemBuilder: (BuildContext context, int index) {
                  return MenuItem(
                    name: globals.order[index].name,
                    //allergens: listOfMenuItems[index].allergens,
                    calories: int.parse(globals.order[index].calories),
                    description: globals.order[index].description,
                    price: globals.order[index].price,
                  );
                },
              ),
            )

                // Container(
                //   child:
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       //Items Column => Convert to ListView
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             "Items: ",
                //             style: kOrderColumnHeaderTextStyle,
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "Coca Cola",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "Caesar Salad",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "Rib-Eye Steak",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //         ],
                //       ),
                //
                //       //Quantity Column => Convert to ListView
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             "Qty: ",
                //             style: kOrderColumnHeaderTextStyle,
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "1",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "2",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "1",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //         ],
                //       ),
                //
                //       //Price Column => Convert to ListView
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             "Price: ",
                //             style: kOrderColumnHeaderTextStyle,
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "\$ 1.79",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "\$ 7.49",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.symmetric(vertical: kRowSpacing),
                //             child: Text(
                //               "\$ 29.02",
                //               style: kOrderDetailsTextStyle,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                ),
            Padding(
              padding: const EdgeInsets.only(right: 170.0),
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
                    "\$${getTotal(globals.order)}",
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
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //TODO: Functionality for dineOptions
                            setState(() {
                              isSelected = DineOption.dineIn;
                            });
                          },
                          child: Container(
                            height: 90.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected == DineOption.dineIn
                                        ? Colors.grey
                                        : Colors.white,
                                    blurRadius: 4.0,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                color: isSelected == DineOption.dineIn
                                    ? kGreen
                                    : kMintGreen,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: Text(
                                "Dine In",
                                style: TextStyle(
                                  color: kOffWhite,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Functionality for dineOptions
                            setState(() {
                              isSelected = DineOption.toGo;
                            });
                          },
                          child: Container(
                            height: 90.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected == DineOption.toGo
                                        ? Colors.grey
                                        : Colors.white,
                                    blurRadius: 4.0,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                color: isSelected == DineOption.toGo
                                    ? kGreen
                                    : kMintGreen,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                              child: Text(
                                "To Go",
                                style: TextStyle(
                                  color: kOffWhite,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/MenuPage");
                          },
                          child: Container(
                            height: 90.0,
                            child: Center(
                              child: Text(
                                "Add More",
                                style: TextStyle(
                                  color: kOffWhite,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                          ),
                          onPressed: () {
                            //TODO: Add functionality to send to kitchen or something?
                            //send to database cause why not
                            sendData(globals.order);
                            print("hey");
                          },
                          child: Container(
                            height: 90.0,
                            child: Center(
                              child: Text(
                                "Place Order",
                                style: TextStyle(
                                  color: kOffWhite,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

//helper functions
double getTotal(List<menuItem> order) {
  double total = 0;
  //parse through and get total
  for (int i = 0; i < order.length; i++) {
    total += double.parse(order[i].price.substring(1));
  }
  return total;
}
