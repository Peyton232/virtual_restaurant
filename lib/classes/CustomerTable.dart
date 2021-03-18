


import 'package:flutter/cupertino.dart';
import 'package:virtual_restaurant/classes/Order.dart';


//A CustomerTable object should be created upon assignment to a device by the manager.
class CustomerTable {
  int _tableID;//the table's number
  bool tableInUse;//whether or not the table is in use.
  List<Order> _ordersFromTable;//This is a list of all of the orders sent to the kitchen to be fulfilled.
  double tableBillTotal;//This is the total the current table must pay from all of the orders sent.


  CustomerTable({
    @required int tableID
  }) {
    this._tableID = tableID;
    this.tableInUse = true;
    this.tableBillTotal = 0.0;
    _ordersFromTable = [];
  }
  //getter for tableID
  int get tableID => this._tableID;
  //setter for tableID with some bounds checking. It does not check the database
  // for duplicate tables so it is likely this method will end up being changed.
  // TODO: check for table in database to ensure we do not have duplicate tables. Better: have tables be assigned from the database
  set tableID(int newTableNumber) {
    if( newTableNumber > 20 || newTableNumber <= 0 )
      throw Exception(["Table Number out of bounds"]);
    else
      this._tableID = newTableNumber;
  }
}