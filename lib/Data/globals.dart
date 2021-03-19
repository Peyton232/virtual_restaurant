library my_prj.globals;

import 'package:virtual_restaurant/CustomWidgets/MenuItem.dart';

bool kidsMode = false;
String tableID = 'T2';
String kidsModePassword = '';

//list of entrees
List<MenuItem> entrees = [
  MenuItem(
    name: "Scrappy head",
    description: "<item description>",
    price: "\$23.44",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of appetizers
List<MenuItem> appetizers = [
  MenuItem(
    name: "Scrappy sticks",
    description: "<item description>",
    price: "\$7.99",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of sides
List<MenuItem> sides = [
  MenuItem(
    name: "Scrappy Fries",
    description: "<item description>",
    price: "\$2.33",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of kidsMeals
List<MenuItem> kidsMeals = [
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of desserts
List<MenuItem> desserts = [
  MenuItem(
    name: "Scrappy's ice cream",
    description: "<item description>",
    price: "\$2.93",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of drinks, just need name
List<MenuItem> drinks = [
  MenuItem(
    name: "Scrappy juice",
    description: "<item description>",
    price: "\$1.11",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  MenuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//order, initially empty
List<MenuItem> order = [];
