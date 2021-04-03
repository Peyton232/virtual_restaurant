
import 'package:virtual_restaurant/classes/BillOrder.dart';
import 'package:virtual_restaurant/classes/JsonConversion.dart';

//A CustomerTable object should be created upon assignment to a device by the manager.
class CustomerTable with JsonConversion {

  int tableNumber;
  List<BillOrder> ordersFromTable;
  double tableBillTotal;
  int ordersPlacedAtTable;

  CustomerTable({
    this.tableNumber,
    this.ordersFromTable,
    this.tableBillTotal,
    this.ordersPlacedAtTable
  });

  CustomerTable.newTable(int tableNum) {
    this.tableNumber = tableNum;
    ordersFromTable = [];
    this.tableBillTotal = 0.0;
    ordersPlacedAtTable = 0;
  }

  int get getTableNumber => this.tableNumber;
  double get getTableBillTotal => this.tableBillTotal;
  List<BillOrder> get getOrdersFromTable => this.ordersFromTable;
  int get getOrdersAtTable => this.ordersPlacedAtTable;

  set setTableBillTotal(double updateTotal) => this.tableBillTotal;
  set setOrdersFromTable(List<BillOrder> updateOrders) => this.ordersFromTable;
  set setOrdersAtTable(int updateOrdersAtTable) => this.getOrdersAtTable;


  int addOrderToTable(BillOrder orderToAdd) {
    ordersFromTable.add(orderToAdd);
    this.tableBillTotal += orderToAdd.getPrice;
    this.ordersPlacedAtTable++;
    return getOrdersAtTable;
  }

  @override
  CustomerTable fromJson(Map<String, dynamic> json) {
    return CustomerTable(
        tableNumber : json.containsKey("tableNumber") ? json["tableNumber"] : -1,
        ordersFromTable : json.containsKey("ordersFromTable") ? json["ordersFromTable"] : -1,
        tableBillTotal : json.containsKey("tableBillTotal") ? json["tableBillTotal"] : -1,
        ordersPlacedAtTable : json.containsKey("ordersAtTable") ? json["ordersAtTable"]  : -1
    );
  }


  @override
  Map<String, dynamic> toJson() {
    return{
      "tableNumber" : getTableNumber,
      "ordersFromTable" : getOrdersFromTable,
      "tableBillTotal" : getTableBillTotal,
      "ordersAtTable" : getOrdersAtTable
    };
  }



}
