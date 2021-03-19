import 'package:flutter/material.dart';



class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: const Center(child: Text("Press the button kronk!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
          );
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.red,
      ),
    );
  }
}
