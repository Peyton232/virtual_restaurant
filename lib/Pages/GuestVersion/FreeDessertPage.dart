import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class RandomDessertItem {
  bool currentSelection;
  String dessertName;

  RandomDessertItem({this.currentSelection, this.dessertName});
}

final List<RandomDessertItem> displayedDessert = [
  RandomDessertItem(
    dessertName: "Cheesecake",
    currentSelection: false,
  ),
  RandomDessertItem(
    dessertName: "Strawberry Shortcake",
    currentSelection: false,
  ),
  RandomDessertItem(
    dessertName: "Vanilla Ice Cream",
    currentSelection: false,
  ),
  RandomDessertItem(
    dessertName: "Nothing",
    currentSelection: false,
  ),
];

class FreeDessertPage extends StatefulWidget {
  @override
  _FreeDessertPageState createState() => _FreeDessertPageState();
}

class _FreeDessertPageState extends State<FreeDessertPage> {
  bool inCenterOfScreen = false;
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);

  double _height = 300;
  double _width = 500;

  double _updateState() {
    setState(() {
      _height = _height == 300 ? 200 : 300;
      _width = _width == 500 ? 200 : 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Earn Chance to Win Free Dessert",
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: displayedDessert.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      color: kGreen,
                      height: _height,
                      width: _width,
                      child: Center(
                        child: Text(displayedDessert[index].dessertName),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 300.0,
              vertical: 50.0,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kLightGreen,
              ),
              onPressed: () {
                _updateState();
              },
              child: Container(
                height: 60,
                width: 350,
                child: Center(
                  child: Text(
                    "TRY",
                    style: TextStyle(
                      fontSize: 30,
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
