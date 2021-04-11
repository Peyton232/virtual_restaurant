import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/CheckoutPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/FreeDessertPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GamesPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GoodbyePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/GuestHomeScreen.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/ManagersChoicePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyOrderPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/MyBillPage.dart';
import 'file:///C:/Users/david/IdeaProjects/virtual_restaurant/lib/Pages/ManagerVersion/PickTablePage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/RequestRefillPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SettingsPage.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/SplitBillPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/AddMenuItemForm.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ChangeMealOfDayPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ChangeMenuPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ItemsSold.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerLoginScreen.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/ManagerReportPage.dart';
import 'package:virtual_restaurant/Pages/ManagerVersion/TipsGained.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/CustomerRequests.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterHomeScreen.dart';
import 'package:virtual_restaurant/Pages/WaiterVersion/WaiterLoginScreen.dart';
import 'package:virtual_restaurant/Pages/KitchenVersion/KitchenLoginScreen.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/games/MineSweeper.dart';
import 'Pages/GuestVersion/KidsModeEntrancePage.dart';
import 'Pages/GuestVersion/KidsModeExitPage.dart';
import 'Pages/GuestVersion/QRPage.dart';
import 'Pages/KitchenVersion/KitchenHomeScreen.dart';
import 'Pages/ManagerVersion/ManagerHomeScreen.dart';
import 'Pages/welcomeScreen.dart';
import 'Data/constants.dart';
import 'Pages/GuestVersion/MenuPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      highContrastTheme: ThemeData(
        primaryColor: Colors.green[900],
        scaffoldBackgroundColor: Colors.white,
      ),
      theme: ThemeData(
        primaryColor: kDarkGreen,
        scaffoldBackgroundColor: kOffWhite,
      ),
      title: 'Virtual Restaurant',
      initialRoute: "/WelcomeScreen",
      //This is where you will put the different pages we can navigate to
      routes: {
        "/WelcomeScreen": (context) => WelcomePage(),
        "/GuestHomeScreen": (context) => GuestHomeScreen(),
        "/ManagerHomeScreen": (context) => ManagerHomeScreen(),
        "/ManagerReportPage": (context) => ManagerReportPage(),
        "/ManagerLoginScreen": (context) => ManagerLoginScreen(),
        "/KitchenLoginScreen": (context) => KitchenLoginScreen(),
        "/ChangeMenuPage": (context) => AvalibleItems(),
        "/WaiterLoginScreen": (context) => WaiterLoginScreen(),
        "/MenuPage": (context) => MenuScreen(),
        "/SettingsPage": (context) => SettingsPage(),
        //"/MyOrderPage": (context) => MyOrderPage(),
        "/MyBillPage": (context) => MyBillPage(),
        "/ManagersChoicePage": (context) => ManagersChoicePage(),
        "/MyOrderPage": (context) => MyOrderPage(),
        "/FreeDessertPage": (context) => SpinningWheel(),
        "/QRPage": (context) => QR(),
        "/GamesPage": (context) => GamesPage(),
        "/RequestRefillPage": (context) => RequestRefillPage(),
        "/SplitBillPage": (context) => SplitBillPage(),
        "/KitchenHomeScreen": (context) => KitchenHomeScreen(),
        "/CheckoutPage": (context) => CheckoutPage(),
        "/KidsModeEntrancePage": (context) => KidsModeEntrancePage(),
        "/KidsModeExitPage": (context) => KidsModeExitPage(),
        "/MineSweeperPage": (context) => MineSweeperPage(),
        "/ChangeMealOfDayPage": (context) => ChangeMealOfDayPage(),
        "/GoodbyePage": (context) => GoodbyePage(),
        "/WaiterHomeScreen": (context) => WaiterHomeScreen(),
        "/CustomerRequests": (context) => CustomerRequests(),
        "/PickTablePage": (context) => PickTablePage(),
        "/TipsGained": (context) => TipsGained(),
        "/ItemsSoldPage": (context) => ItemsSoldPage(),
        "/AddMenuItemForm": (context) => AddMenuItemForm(),
      },
    );
  }
}
