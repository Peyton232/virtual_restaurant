import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;

/*
This is used to create the individual UI for each menu item in the list
in globals.dart
 */

class MenuItem extends StatefulWidget {
  String name;
  String description;
  String price;
  String calories;
  String allergens;

  MenuItem({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.calories,
    @required this.allergens,
    //@required this.image,
  });

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  AssetImage image;

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
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "${widget.description}",
                  style: TextStyle(fontSize: 17.0),
                ),
                Text(
                  "${widget.calories} calories",
                  style: TextStyle(fontSize: 17.0),
                ),
                Text(
                  "Allergens: ${widget.allergens}",
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
                      content: Text("${widget.name} added to order!"),
                    ));
                    print("Add to Order pressed");

                    //TODO: Add to order functionality
                    globals.order.add(
                      MenuItem(
                        name: widget.name,
                        description: widget.description,
                        price: widget.price,
                        calories: widget.calories,
                        allergens: widget.allergens,
                        //image: "https://browseyou.com/media/img/src/no-item.jpg",
                      ),
                    );
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
