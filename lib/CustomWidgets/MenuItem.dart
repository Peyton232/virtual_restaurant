import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class MenuItem extends StatelessWidget {
  final Image image;
  final String name;
  final double price;
  final int calories;
  final String description;
  final String allergens;

  MenuItem({
    this.image,
    @required this.name,
    @required this.allergens,
    @required this.calories,
    @required this.description,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.2),
        ),
      ),
      height: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              width: 250,
              color: Colors.grey,
              child: Center(
                child: Text("Image"), //TODO: Replace text with image
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "$description",
                  style: TextStyle(fontSize: 17.0),
                ),
                Text(
                  "$calories calories",
                  style: TextStyle(fontSize: 17.0),
                ),
                Text(
                  "Allergens: $allergens",
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("$name added to order!"),
                    ));
                    print("Add to Order pressed");
                    //TODO: Add to order functionality
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kLightGreen),
                    elevation: MaterialStateProperty.all(4.0),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.green[300]),
                  ),
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        "Add to Order",
                        style: TextStyle(
                          fontSize: 20,
                          //TODO: Have text adapt to container size when changing screen orientation
                        ),
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
