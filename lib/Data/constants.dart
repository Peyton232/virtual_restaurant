import 'package:flutter/material.dart';

//Colors used throughout the application
const kDarkGreen = Color(0xff054a29);
const kSemiDarkGreen = Color(0xff137547);
const kGreen = Color(0xff2a9134);
const kSemiLightGreen = Color(0xff3fa34d);
const kLightGreen = Color(0xff5bba6f);
const kMintGreen = Color(0xff95d5b2);
const kOffWhite = Color(0xfff5f5f5);
const kSemiBlack = Color(0xff121212);

//Welcome Screen Constants
const kLoginCardTextStyle = TextStyle(fontSize: 30.0, color: kSemiBlack);
const kAppBarTextStyle = TextStyle(fontSize: 25.0);
const kOrderColumnHeaderTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
  color: kSemiBlack,
);
const kOrderDetailsTextStyle = TextStyle(fontSize: 30.0, color: kSemiBlack);
const kRowSpacing = 30.0;

const kOrderInfoTextStyle = TextStyle(fontSize: 30.0);
const kOrderHeaderTextStyle =
    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);

//The different categories that food menu items belong to
enum FoodCategory { Appetizer, Dessert, Drink, Entree, KidsMeal, Side }

String toStringFoodCategory(FoodCategory cat) {
  switch (cat) {
enum FoodCategory {
  Appetizer,
  Dessert,
  Drink,
  Entree,
  KidsMeal,
  Side
}

String toStringFoodCategory(FoodCategory cat) {
  switch(cat) {
    case FoodCategory.Appetizer:
      return "Appetizer";
    case FoodCategory.Dessert:
      return "Dessert";
    case FoodCategory.Drink:
      return "Drink";
    case FoodCategory.Entree:
      return "Entree";
    case FoodCategory.KidsMeal:
      return "Kids Meal";
    case FoodCategory.Side:
      return "Side";
    default:
      return "null";
  }
}

FoodCategory toFoodCategoryFromString(String cat) {
  switch (cat) {

FoodCategory toFoodCategoryFromString(String cat){
  switch(cat){
    case "Appetizer":
    case "Appetizers":
      return FoodCategory.Appetizer;
    case "Dessert":
    case "Desserts":
      return FoodCategory.Dessert;
    case "Drink":
    case "Drinks":
      return FoodCategory.Drink;
    case "Entree":
    case "Entrees":
      return FoodCategory.Entree;
    case "KidsMeals":
    case "Kids Meal":
    case "KidsMeal":
      return FoodCategory.KidsMeal;
    case "Side":
    case "Sides":
      return FoodCategory.Side;
  }
}

const MaxNumberOfTables = 20;

