import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This is the page where the customer can request multiple drinks at once
 */

class Drink {
  bool isSelected;
  String drinkName;

  Drink({
    this.isSelected,
    this.drinkName,
  });
}

class RequestRefillPage extends StatefulWidget {
  @override
  _RequestRefillPageState createState() => _RequestRefillPageState();
}

class _RequestRefillPageState extends State<RequestRefillPage> {
  List<Drink> currentOrderDrinks = [
    Drink(
      isSelected: false,
      drinkName: "Coca Cola",
    ),
    Drink(
      isSelected: false,
      drinkName: "Water",
    ),
    Drink(
      isSelected: false,
      drinkName: "Hot Chocolate",
    ),
    Drink(
      isSelected: false,
      drinkName: "Sprite",
    ),
    Drink(
      isSelected: false,
      drinkName: "Mango Smoothie",
    ),
  ];

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
                "Which drink(s) would you like to refill?",
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
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
              ),
              child: GridView.count(
                childAspectRatio: 6,
                crossAxisCount: 2,
                children: List.generate(currentOrderDrinks.length, (index) {
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    color: kOffWhite,
                    elevation: 3.0,
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                        currentOrderDrinks[index].drinkName,
                        style: kLoginCardTextStyle,
                      ),
                      value: currentOrderDrinks[index].isSelected,
                      onChanged: (bool value) {
                        setState(() {
                          currentOrderDrinks[index].isSelected = value;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Request Drink has been pressed");
                  Navigator.pop(context);
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
