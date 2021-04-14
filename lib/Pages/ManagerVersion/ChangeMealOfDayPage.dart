import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';

/*
This is where the manager can edit the meal of day

 that the customer can see
 */

List<MenuItem> mChoiceList = [...entrees, ...appetizers, ...sides, ...desserts];

class ChangeMealOfDayPage extends StatefulWidget {
  @override
  _ChangeMealOfDayPageState createState() => _ChangeMealOfDayPageState();
}

class _ChangeMealOfDayPageState extends State<ChangeMealOfDayPage> {
  List<Widget> grid_items = [];
  int mealOfday_place = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < mChoiceList.length; i++) {
      grid_items.add(Item_Card(i));
    }
  }

  //TODO: Change base to currently chosen meal of day

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
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      'Meal of the Day: ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: MealOfDay(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: GridView.count(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                crossAxisCount: 3,
                childAspectRatio: 5 / 3,
                children: grid_items,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //    Card for items in grid
  Widget Item_Card(int place) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green[800],
      ),
      onPressed: () {
        //print([mChoiceList.length, place]);
        setState(() {
          mealOfday_place = place;
        });
        //print(mealOfday_place);
      },
      child: Center(
        child: Text(mChoiceList[place].getItemName),
      ),
    );
  }

  //                      Widget for the selected meal of day
  Widget MealOfDay() {
    String image = mChoiceList[mealOfday_place].getImageStr;
    String name = mChoiceList[mealOfday_place].getItemName;
    String price = mChoiceList[mealOfday_place].getPrice;
    int calories = mChoiceList[mealOfday_place].getCalories;
    String description = mChoiceList[mealOfday_place].getDescription;
    List<String> allergens = mChoiceList[mealOfday_place].getAllergens;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.2),
        ),
      ),
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
                child: Image.network(image), //TODO: Replace text with image
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
                  price,
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
                      content: Text("$name is now the Meal Of The Day!"),
                    ));
                    print("Add to Meal of Day pressed");

                    mealOFTheDay.name = name;
                    mealOFTheDay.image = image;
                    mealOFTheDay.price = price;
                    mealOFTheDay.calories = calories;
                    mealOFTheDay.description = description;
                    mealOFTheDay.allergens = allergens;

                    //make a change to database
                    changeMealOfDay();

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
                        "Change",
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
