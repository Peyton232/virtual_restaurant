library my_prj.globals;

import 'dart:collection';

import 'package:virtual_restaurant/classes/CustomerTable.dart';
import 'package:virtual_restaurant/classes/billOrder.dart';
import 'package:virtual_restaurant/classes/kitchenOrder.dart';

import '../classes/menuItem.dart';

int waitList = 0;

bool kidsMode = false;
String kidsModePassword = '';
String modification = '';
String tableID = 'T3';  //To be set by manager

CustomerTable thisDevicesTable = CustomerTable(tableNum:1);
List<MenuItem> order = [];//order, initially empty
ListQueue<KitchenOrder> kitchenOrders;

//money variables for bill
double total = 0;
double tip = 0;
int waysToSplitBill = 1;

//Add to Menu form
MenuItem tempItem;

//variables for reports
var itemsSold;
var totalSold;
var itemsComped;
var tipsGained;
var totalRevenue;

//waiter variables
//move this class later
class orderItems{
  String table;
  Map<dynamic, dynamic> items;

  orderItems({
    this.table,
    this.items,
  });
}
List<orderItems> itemsToOrder = [];

MenuItem mealOFTheDay = MenuItem(
  name: "Scrappy head",
  description: "<item description>",
  price: "\$23.44",
  calories: 9000,
  allergens: ["dairy", "gluten"],
  //image: "https://browseyou.com/media/img/src/no-item.jpg",
  finished: false,
);

//list of entrees
List<MenuItem> entrees = [];

//list of appetizers
List<MenuItem> appetizers = [];

//list of sides
List<MenuItem> sides = [];

//list of kidsMeals
List<MenuItem> kidsMeals = [];

//list of desserts
List<MenuItem> desserts = [];

//list of drinks, just need name
List<MenuItem> drinks = [];



