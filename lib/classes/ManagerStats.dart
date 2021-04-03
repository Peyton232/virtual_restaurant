import 'package:virtual_restaurant/classes/JsonConversion.dart';
import 'BillOrder.dart';
import 'OrderItem.dart';
import 'MenuItem.dart';

class ManagerStats with JsonConversion{

  double totalSales;
  MenuItem managersChoice;
  List<OrderItem> comped;
  Map<String, int> appetizersSold;
  Map<String, int> entreesSold;
  Map<String, int> sidesSold;
  Map<String, int> drinksSold;
  Map<String, int> dessertsSold;
  Map<String, int> kidMealsSold;

  ManagerStats({
    this.totalSales,
    this.managersChoice,
    this.comped,
    this.appetizersSold,
    this.entreesSold,
    this.sidesSold,
    this.drinksSold,
    this.dessertsSold,
    this.kidMealsSold,
  });

  ManagerStats.newStats(){
    this.totalSales = 0;
    this.managersChoice = null;
    this.comped = [];
    this.appetizersSold = {};
    this.entreesSold = {};
    this.sidesSold = {};
    this.drinksSold = {};
    this.dessertsSold = {};
    this.kidMealsSold = {};

  }

  double get getTotalSales => totalSales;
  MenuItem get getManagersChoice => managersChoice;
  List<OrderItem> get getComped => comped;
  Map<String, int> get getAppetizersSold => this.appetizersSold;
  Map<String, int> get getEntreesSold => this.entreesSold;
  Map<String, int> get getSideSold => this.sidesSold;
  Map<String, int> get getDrinksSold => this.drinksSold;
  Map<String, int> get getDessertsSold => this.dessertsSold;
  Map<String, int> get getKidMealsSold => this.kidMealsSold;

  set setAppetizersSold(Map<String, int> updateAppetizersSold) => this.appetizersSold;
  set setEntreesSold(Map<String, int> updateEntreesSold) => this.entreesSold;
  set setSidesSold(Map<String, int> updateSidesSold) => this.sidesSold;
  set setDrinksSold(Map<String, int> updateDrinksSold) => this.drinksSold;
  set setDessertsSold(Map<String, int> updateDessertsSold) => this.dessertsSold;
  set setKidMealsSold(Map<String, int> updateKidMealsSold) => this.kidMealsSold;

  @override
  ManagerStats fromJson(Map<String, dynamic> json) {
    return ManagerStats(
        totalSales : json.containsKey("totalSales") ? json["totalSales"] : -1,
        managersChoice : json.containsKey("managersChoice") ? json["managersChoice"] : null,
        comped : json.containsKey("comped") ? json["comped"] : null,
        appetizersSold : json.containsKey("appetizers") ? json["appetizers"] : null,
        entreesSold : json.containsKey("entress") ? json["entrees"] : null,
        sidesSold : json.containsKey("sides") ? json["sides"] : null,
        drinksSold : json.containsKey("drinks") ? json["sides"] : null,
        dessertsSold : json.containsKey("desserts") ? json["desserts"] : null,
        kidMealsSold : json.containsKey("kidMeals") ? json["kidMeals"] : null
    );

  }

  @override
  Map<String, dynamic> toJson() {
    return{
      "totalSales" : getTotalSales,
      "managersChoice" : getManagersChoice,
      "comped" : getComped,
      "appetizers" : getAppetizersSold,
      "entrees" : getEntreesSold,
      "sides" : getSideSold,
      "drinks" : getDrinksSold,
      "desserts" : getDessertsSold,
      "kidMeals" : getKidMealsSold

    };

  }


}