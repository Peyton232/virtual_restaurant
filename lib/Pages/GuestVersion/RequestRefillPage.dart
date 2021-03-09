import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class RequestRefillPage extends StatefulWidget {
  @override
  _RequestRefillPageState createState() => _RequestRefillPageState();
}

class _RequestRefillPageState extends State<RequestRefillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Drink Refills"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Which drink would you like to refill?",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: <Widget>[
                  Center(
                    child: RefillOptionButton(
                      drinkName: "Coca Cola",
                    ),
                  ),
                  Center(
                    child: RefillOptionButton(
                      drinkName: "Sweet Tea",
                    ),
                  ),
                  Center(
                    child: RefillOptionButton(
                      drinkName: "Hot Chocolate",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                child: ElevatedButton(
                  onPressed: () {
                    print("Request Drink has been pressed");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kLightGreen),
                    elevation: MaterialStateProperty.all(4.0),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.green[300]),
                  ),
                  child: Container(
                    height: 70,
                    width: 300,
                    child: Center(
                      child: Text(
                        "Request Drink",
                        style:
                            kLoginCardTextStyle, // took this from login screen style
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RefillOptionButton extends StatelessWidget {
  final String drinkName;

  RefillOptionButton({this.drinkName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 50, right: 50),
      child: ElevatedButton(
        onPressed: () {
          print("$drinkName has been pressed");
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kOffWhite),
          elevation: MaterialStateProperty.all(4.0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
        ),
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              drinkName,
              style: kLoginCardTextStyle, // took this from login screen style
            ),
          ),
        ),
      ),
    );
  }
}
