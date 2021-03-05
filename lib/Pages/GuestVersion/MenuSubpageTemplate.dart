import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

class MenuSubpageTemplate extends StatelessWidget {
  final String menuCategory;

  MenuSubpageTemplate({
    this.menuCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuCategory),
      ),
      body: MenuItem(),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Image image;
  final String title;
  final double price;
  final int calories;
  final String description;
  final String allergens;

  MenuItem({
    this.image,
    this.title,
    this.allergens,
    this.calories,
    this.description,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Scrappy's Sticks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "\$4.25",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Brief Description: Cheesestick made of 100% real scrappy",
                  style: TextStyle(),
                ),
                Text("Calories: "),
                Text("Allergens (optional):"),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                height: 40,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "Add to Order",
                    style: TextStyle(
                      fontSize: 20,
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
