import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';
import 'package:virtual_restaurant/Data/globals.dart' as global;


class AddMenuItemForm extends StatefulWidget {
  @override
  _AddMenuItemFormState createState() => _AddMenuItemFormState();
}

class _AddMenuItemFormState extends State<AddMenuItemForm> {
  String itemCat = "Entrees";

  String itemName;
  String itemDescription;
  String itemPrice;
  int itemCal;
  String origAllergens;
  List<String> itemAllergens;


  //Fake Card information
  bool itemNameFilled = false;
  bool DescriptionFilled = false;
  bool priceFilled = false;
  bool caloriesFilled = false;

  //Text Field stuff
  TextEditingController _nameController;
  TextEditingController _DescriptionController;
  TextEditingController _priceController;
  TextEditingController _caloriesController;
  TextEditingController _allergensController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _DescriptionController = TextEditingController();
    _priceController = TextEditingController();
    _caloriesController = TextEditingController();
    _allergensController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _DescriptionController.dispose();
    _priceController.dispose();
    _caloriesController.dispose();
    _allergensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Menu Item"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Category: ${itemCat}", style: TextStyle(fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kMintGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      itemCat = "Entrees";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Entrees",
                        style: TextStyle(
                          fontSize: 20.0,
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
                      itemCat = "Appetizers";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Appetizers",
                        style: TextStyle(
                          fontSize: 20.0,
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
                      itemCat = "Sides";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Sides",
                        style: TextStyle(
                          fontSize: 20.0,
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
                      itemCat = "Kids Meals";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Kids Meals",
                        style: TextStyle(
                          fontSize: 20.0,
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
                      itemCat = "Desserts";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Desserts",
                        style: TextStyle(
                          fontSize: 20.0,
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
                      itemCat = "Drinks";
                    });
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        "Drinks",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: kSemiBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            _cardInfo(),
            SizedBox(height: 50.0),
            _checkoutButton(),
          ],
        ),
      ),
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
              "Item Name:",
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
                  itemNameFilled = true;
                }
                itemName = value;
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
                hintText: "Enter name of item",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //Card Number
            Text(
              "Description:",
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
                  DescriptionFilled = true;
                }
                itemDescription = value;
                //print(itemDescription);
              },
              controller: _DescriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                hintText: "Enter description of item",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Row(
              children: <Widget>[
                //Expiration Date
                Text(
                  "Price:",
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
                        priceFilled = true;
                      }
                      itemPrice = value;
                    },
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      new WhitelistingTextInputFormatter(RegExp("[\/0-9.]")),
                      //new WhitelistingTextInputFormatter(RegExp("[\/.]")),
                    ],
                    controller: _priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      hintText: "price",
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),

                //Security Code
                Text(
                  "Calories:",
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
                        caloriesFilled = true;
                      }
                      itemCal = int.parse(value);
                    },
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    ],
                    controller: _caloriesController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      hintText: "calories",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  "Allergens:",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (String value) {
                origAllergens = value;
              },
              controller: _allergensController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                hintText: "Enter allergens separated by spaces",
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Create item
  Widget _checkoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kGreen,
        ),


        onPressed: () {
          if (itemNameFilled &&
              priceFilled &&
              DescriptionFilled &&
              caloriesFilled)
          {

            itemAllergens = origAllergens.split(' ');
            print(itemAllergens);
            print([itemName, itemDescription, itemPrice, itemCal]);

            addItem(itemCat, itemAllergens, itemName, itemDescription, itemPrice, itemCal);


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
              "Create Item",
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
