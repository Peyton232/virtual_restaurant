library my_prj.globals;

import '../classes/menuItem.dart';

bool kidsMode = false;
String tableID = 'T2';
String kidsModePassword = '';

//list of entrees
List<menuItem> entrees = [
  menuItem(
    name: "Scrappy head",
    description: "<item description>",
    price: "\$23.44",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of appetizers
List<menuItem> appetizers = [
  menuItem(
    name: "Scrappy sticks",
    description: "<item description>",
    price: "\$7.99",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of sides
List<menuItem> sides = [
  menuItem(
    name: "Scrappy Fries",
    description: "<item description>",
    price: "\$2.33",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of kidsMeals
List<menuItem> kidsMeals = [
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of desserts
List<menuItem> desserts = [
  menuItem(
    name: "Scrappy's ice cream",
    description: "<item description>",
    price: "\$2.93",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//list of drinks, just need name
List<menuItem> drinks = [
  menuItem(
    name: "Scrappy juice",
    description: "<item description>",
    price: "\$1.11",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
  menuItem(
    name: "<item name>",
    description: "<item description>",
    price: "\$0.00",
    calories: "9000",
    allergens: "dairy gluten",
    //image: "https://browseyou.com/media/img/src/no-item.jpg",
  ),
];

//order, initially empty
List<menuItem> order = [];