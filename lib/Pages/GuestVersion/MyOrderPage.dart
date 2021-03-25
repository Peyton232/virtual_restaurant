import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
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
  TextEditingController _commentsController;

  @override
  void initState() {
    super.initState();
    _commentsController = TextEditingController();
  }

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/GuestHomeScreen");
            },
          ),
        ],
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
                      margin: EdgeInsets.only(
                        left: 100.0,
                        right: 50.0,
                        top: 10.0,
                        bottom: 10.0,
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
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Are you sure you want to delete ${globals.order[index].name}?"),
                                      actions: <Widget>[
                                        MaterialButton(
                                          elevation: 5.0,
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {
                                            //TODO: remove item from list
                                          },
                                        ),
                                        MaterialButton(
                                          elevation: 5.0,
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: kSemiDarkGreen,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                                // createAlertDialog(
                                //   context,
                                //   globals.order[index].name,
                                // );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
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
                right: globals.order.isEmpty ? 130.0 : 360.0,
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
                    "\$${globals.thisDevicesTable.tableBillTotal}",//TODO: This must be fixed to reflect Michael's changes.
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
            Container(
              margin: EdgeInsets.only(
                left: 100.0,
                bottom: 5,

              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Additional Comments: ",
                style: TextStyle(
                  fontSize: 20.0,
                  color: kSemiBlack,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 100.0,
                  right: 100.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[600],
                    width: 0.5,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                //Gets current device's width ^
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _commentsController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      border: InputBorder.none,
                      hintText:
                          "Ex. No pickles and onions on Scrappy Burger...",
                    ),
                  ),
                  /*
                  To get the text inside the text box: _commentsController.text
                   */
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      // top: 20.0,
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
                            //sendData(globals.order);
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

  Widget _header() {
    return Card(
      color: kOffWhite,
      elevation: 0,
      margin: EdgeInsets.only(
        left: 190.0,
        right: 355.0,
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
}

createAlertDialog(BuildContext context, String itemName) {
  TextEditingController customController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Are you sure you want to delete $itemName?"),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text(
              'Yes',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red,
              ),
            ),
            onPressed: () {
              //TODO: Delete item
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 18.0,
                color: kSemiDarkGreen,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
//helper functions
/*double getTotal(List<MenuItem> order) {
  double total = 0;
  //parse through and get total
  for (int i = 0; i < order.length; i++) {
    total += double.parse(order[i].price.substring(1));
  }
  return total;
}*/