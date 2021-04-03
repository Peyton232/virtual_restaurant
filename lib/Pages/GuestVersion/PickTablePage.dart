import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart';

class PickTablePage extends StatefulWidget {
  @override
  _PickTablePageState createState() => _PickTablePageState();
}

class _PickTablePageState extends State<PickTablePage> {
  @override

  Widget table_button(){
    return ElevatedButton(
        onPressed: (){},
        child: Text(""),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Table'),
      ),
      body: Center(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: (){
                  tableID = "T${index+1}";
                  print(tableID);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("T${index+1}"),
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      ),
    );
  }
}
