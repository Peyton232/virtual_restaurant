import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool cardSelected = false;

  //Fake Card information
  bool cardNameFilled = false;
  bool cardNumberFilled = false;
  bool cardExpFilled = false;
  bool cardSecurityFilled = false;

  //Text Field stuff
  TextEditingController _nameController;
  TextEditingController _numberController;
  TextEditingController _expirationController;
  TextEditingController _securityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _expirationController = TextEditingController();
    _securityController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expirationController.dispose();
    _securityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Bill"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Payment Method:",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kMintGreen,
                  ),
                  onPressed: () {
                    createAlertDialog(context);
                  },
                  child: Container(
                    height: 50.0,
                    width: 150.0,
                    child: Center(
                      child: Text(
                        "Cash",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: kSemiBlack,
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
                    primary: kMintGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      cardSelected = !cardSelected;
                    });
                  },
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    child: Center(
                      child: Text(
                        "Credit/Debit Card",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: kSemiBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            cardSelected ? _cardInfo() : SizedBox(height: 0.0),
            SizedBox(height: 50.0),
            cardSelected ? _checkoutButton() : SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }

  //Call Waiter Alert
  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Waiter is coming soon to collect your payment!"),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                'OK',
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

  //Card information card
  Widget _cardInfo() {
    return Card(
      color: kOffWhite,
      elevation: 3.0,
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Name
            Text(
              "Cardholder Name:",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (String value) {
                if (value != "") {
                  cardNameFilled = true;
                }
              },
              inputFormatters: [
                // ignore: deprecated_member_use
                new WhitelistingTextInputFormatter(RegExp("[\ a-zA-Z]")),
              ],
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                hintText: "Enter name on card",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //Card Number
            Text(
              "Card Number:",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              inputFormatters: [
                // ignore: deprecated_member_use
                new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                new LengthLimitingTextInputFormatter(16),
              ],
              onChanged: (String value) {
                if (value != "") {
                  cardNumberFilled = true;
                }
              },
              controller: _numberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                hintText: "Enter number on card",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Row(
              children: <Widget>[
                //Expiration Date
                Text(
                  "Expiration Date:",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 100,
                  child: TextField(
                    onChanged: (String value) {
                      if (value != "") {
                        cardExpFilled = true;
                      }
                    },
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      new WhitelistingTextInputFormatter(RegExp("[\/0-9]")),
                      new LengthLimitingTextInputFormatter(5),
                    ],
                    controller: _expirationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      hintText: "mm/yy",
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),

                //Security Code
                Text(
                  "Security Code:",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 120,
                  child: TextField(
                    onChanged: (String value) {
                      if (value != "") {
                        cardSecurityFilled = true;
                      }
                    },
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      new LengthLimitingTextInputFormatter(3),
                    ],
                    controller: _securityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      hintText: "3-digit code",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Checkout Button
  Widget _checkoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kGreen,
        ),
        onPressed: () {
          if (cardNameFilled &&
              cardExpFilled &&
              cardNumberFilled &&
              cardSecurityFilled) {
            setState(() {
              globals.order.clear();
            });
            Navigator.pushNamed(context, "/GoodbyePage");
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Some fields are empty"),
                  actions: <Widget>[
                    MaterialButton(
                      elevation: 5.0,
                      child: Text(
                        'OK',
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
        },
        child: Container(
          height: 60.0,
          child: Center(
            child: Text(
              "Checkout",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
