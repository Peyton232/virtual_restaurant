library my_prj.globals;

import 'dart:collection';

import 'package:virtual_restaurant/classes/CustomerTable.dart';
import 'package:virtual_restaurant/classes/billOrder.dart';
import 'package:virtual_restaurant/classes/kitchenOrder.dart';

import '../classes/menuItem.dart';

bool kidsMode = false;
String kidsModePassword = '';

String tableID = 'T2';  //To be set by manager

CustomerTable thisDevicesTable = CustomerTable(tableNum:1);
List<MenuItem> order = [];//order, initially empty
ListQueue<KitchenOrder> kitchenOrders;

//money variables for bill
double total = 0;
double tip = 0;
int waysToSplitBill = 1;


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
List<MenuItem> entrees = [
  MenuItem(
    name: "Scrappy head",
    description: "<item description>",
    price: "\$23.44",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];

//list of appetizers
List<MenuItem> appetizers = [
  MenuItem(
    name: "Scrappy sticks",
    description: "<item description>",
    price: "\$7.99",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];

//list of sides
List<MenuItem> sides = [
  MenuItem(
    name: "Scrappy Fries",
    description: "<item description>",
    price: "\$2.33",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];

//list of kidsMeals
List<MenuItem> kidsMeals = [
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];

//list of desserts
List<MenuItem> desserts = [
  MenuItem(
    name: "Scrappy's ice cream",
    description: "<item description>",
    price: "\$2.93",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];

//list of drinks, just need name
List<MenuItem> drinks = [
  MenuItem(
    name: "Scrappy juice",
    description: "<item description>",
    price: "\$1.11",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: 9000,
    allergens: ["dairy", "gluten"],
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
    finished: false,
  ),
];



