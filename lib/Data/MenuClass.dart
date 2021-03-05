import 'package:flutter/material.dart';

class Menu {
  Image image;
  String name;
  double price;
  int calories;
  String description;
  String allergens;

  //Constructor
  Menu({
    this.image,
    @required this.name,
    @required this.allergens,
    @required this.calories,
    @required this.description,
    @required this.price,
  });
}

final List<Menu> appetizerMenuItems = [
  Menu(
    name: "Scrappy Sticks",
    allergens: "Dairy",
    calories: 720,
    description: "Cheese stick with a twist",
    price: 4.25,
  ),
  Menu(
    name: "Fried Scrappy Legs",
    allergens: "Meat",
    calories: 650,
    description: "Fried chicken with a twist",
    price: 5.25,
  ),
  Menu(
    name: "Scrappy Soup",
    allergens: "Dairy",
    calories: 550,
    description: "Yummy Yummy Soup",
    price: 4.25,
  ),
  Menu(
    name: "Scrappy Cobb Salad",
    allergens: "What can you be allergic with this?",
    calories: 520,
    description: "Cheese stick with a twist",
    price: 6.25,
  ),
];

final List<Menu> entreesMenuItems = [
  Menu(
    name: "(Entree Name)",
    allergens: "(Entree Allergen)",
    calories: 100,
    description: "(Entree Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Entree Name)",
    allergens: "(Entree Allergen)",
    calories: 100,
    description: "(Entree Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Entree Name)",
    allergens: "(Entree Allergen)",
    calories: 100,
    description: "(Entree Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Entree Name)",
    allergens: "(Entree Allergen)",
    calories: 100,
    description: "(Entree Description)",
    price: 00.00,
  ),
];

final List<Menu> sideMenuItems = [
  Menu(
    name: "(Sides Name)",
    allergens: "(Sides Allergen)",
    calories: 100,
    description: "(Sides Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Sides Name)",
    allergens: "(Sides Allergen)",
    calories: 100,
    description: "(Sides Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Sides Name)",
    allergens: "(Sides Allergen)",
    calories: 100,
    description: "(Sides Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Sides Name)",
    allergens: "(Sides Allergen)",
    calories: 100,
    description: "(Sides Description)",
    price: 00.00,
  ),
];

final List<Menu> drinksMenuItems = [
  Menu(
    name: "(Drinks Name)",
    allergens: "(Drinks Allergen)",
    calories: 100,
    description: "(Drinks Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Drinks Name)",
    allergens: "(Drinks Allergen)",
    calories: 100,
    description: "(Drinks Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Drinks Name)",
    allergens: "(Drinks Allergen)",
    calories: 100,
    description: "(Drinks Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Drinks Name)",
    allergens: "(Drinks Allergen)",
    calories: 100,
    description: "(Drinks Description)",
    price: 00.00,
  ),
];

final List<Menu> kidsMealMenuItems = [
  Menu(
    name: "(Kid's Meal Name)",
    allergens: "(Kid's Meal Allergen)",
    calories: 100,
    description: "(Kid's Meal Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Kid's Meal Name)",
    allergens: "(Kid's Meal Allergen)",
    calories: 100,
    description: "(Kid's Meal Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Kid's Meal Name)",
    allergens: "(Kid's Meal Allergen)",
    calories: 100,
    description: "(Kid's Meal Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Kid's Meal Name)",
    allergens: "(Kid's Meal Allergen)",
    calories: 100,
    description: "(Kid's Meal Description)",
    price: 00.00,
  ),
];

final List<Menu> dessertMenuItems = [
  Menu(
    name: "(Dessert Name)",
    allergens: "(Dessert Allergen)",
    calories: 100,
    description: "(Dessert Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Dessert Name)",
    allergens: "(Dessert Allergen)",
    calories: 100,
    description: "(Dessert Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Dessert Name)",
    allergens: "(Dessert Allergen)",
    calories: 100,
    description: "(Dessert Description)",
    price: 00.00,
  ),
  Menu(
    name: "(Dessert Name)",
    allergens: "(Dessert Allergen)",
    calories: 100,
    description: "(Dessert Description)",
    price: 00.00,
  ),
];
