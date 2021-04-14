import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:virtual_restaurant/Data/globals.dart' as globals;
import 'package:virtual_restaurant/Database/database.dart';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

int selcHour = 12;
int selcMin = 0;

class ChangeOpeningClosingTime extends StatefulWidget {
  @override
  _ChangeOpeningClosingTimeState createState() => _ChangeOpeningClosingTimeState();
}

class _ChangeOpeningClosingTimeState extends State<ChangeOpeningClosingTime> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Change Open and Close Times"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1,child: Container()),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(25),
                        child: Text(
                          'Current Opening Time: ',
                          style: TextStyle(fontSize: 20),
                        ),
                    ),
                    Container(
                      child: globals.openMin == 0 ? Text('${globals.openHour}:00', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),) : Text('${globals.openHour}:${globals.openMin}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(25),
                      child: Text(
                        'Current Closing Time: ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      child: globals.closeMin == 0 ? Text('${globals.closeHour}:00', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),) : Text('${globals.closeHour}:${globals.closeMin}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1,child: Container()),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 40,),
              Text(
                "Hour:",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 225,
                child: TextField(
                  onChanged: (String value) {
                    selcHour = int.parse(value);
                    print(selcHour);
                  },
                  inputFormatters: [
                    // ignore: deprecated_member_use
                    new WhitelistingTextInputFormatter(RegExp("[\/0-9.]")),
                    //new WhitelistingTextInputFormatter(RegExp("[\/.]")),
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                    hintText: "Enter hour in 24 hour time",
                  ),
                ),
              ),
              Text(':${selcMin}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(width: 80,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kMintGreen,
                ),
                onPressed: () {
                  setState(() {
                    selcMin = 0;
                    print(selcMin);
                  });
                },
                child: Container(
                  height: 40.0,
                  width: 120.0,
                  child: Center(
                    child: Text(
                      "00",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kSemiBlack,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 80,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kMintGreen,
                ),
                onPressed: () {
                  selcMin = 30;
                  setState(() {

                    print(selcMin);
                  });
                },
                child: Container(
                  height: 40.0,
                  width: 120.0,
                  child: Center(
                    child: Text(
                      "30",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kSemiBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kMintGreen,
                ),
                onPressed: () {
                  setState(() {
                    globals.openHour = selcHour;
                    globals.openMin = selcMin;
                    print('Opening hour set to ${selcHour}:${selcMin}');
                    print('${globals.openHour}:${globals.openMin}');
                  });
                },
                child: Container(
                  height: 70.0,
                  width: 210.0,
                  child: Center(
                    child: Text(
                      "Change Opening Time",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kSemiBlack,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kMintGreen,
                ),
                onPressed: () {
                  setState(() {
                    globals.closeHour = selcHour;
                    globals.closeMin = selcMin;
                    print('Closing hour set to ${selcHour}:${selcMin}');
                    print('${globals.closeHour}:${globals.closeMin}');
                  });
                },
                child: Container(
                  height: 70.0,
                  width: 210.0,
                  child: Center(
                    child: Text(
                      "Change Closing Time",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kSemiBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
