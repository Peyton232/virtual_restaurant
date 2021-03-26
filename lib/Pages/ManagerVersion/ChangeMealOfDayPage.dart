import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';

/*
This is where the manager can edit the menu that the customer can see
 */

class ChangeMealOfDayPage extends StatefulWidget {
  @override
  _ChangeMealOfDayPageState createState() => _ChangeMealOfDayPageState();
}


class _ChangeMealOfDayPageState extends State<ChangeMealOfDayPage> {


  Widget item_Card(){
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text('hello'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
            title: Text(
              "Change Meal of Day",
              style: kAppBarTextStyle,
            ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text('Meal of the Day: ', style: TextStyle(fontSize: 20),),
                ),
                Center(
                  child: Text('TADA'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
            ),
          ),
        ],
      ),
    );
  }
}
