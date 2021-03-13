import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';
import 'package:virtual_restaurant/CustomWidgets/CustomButton.dart';

// class RandomDessertItem {
//   bool currentSelection;
//   String dessertName;
//
//   RandomDessertItem({this.currentSelection, this.dessertName});
// }
//
// final List<RandomDessertItem> displayedDessert = [
//   RandomDessertItem(
//     dessertName: "Cheesecake",
//     currentSelection: false,
//   ),
//   RandomDessertItem(
//     dessertName: "Strawberry Shortcake",
//     currentSelection: false,
//   ),
//   RandomDessertItem(
//     dessertName: "Vanilla Ice Cream",
//     currentSelection: false,
//   ),
//   RandomDessertItem(
//     dessertName: "Nothing",
//     currentSelection: false,
//   ),
// ];
//
// class FreeDessertPage extends StatefulWidget {
//   @override
//   _FreeDessertPageState createState() => _FreeDessertPageState();
// }
//
// class _FreeDessertPageState extends State<FreeDessertPage> {
//   bool inCenterOfScreen = false;
//   Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);
//
//   double _height = 300;
//   double _width = 500;
//
//   double _updateState() {
//     setState(() {
//       _height = _height == 300 ? 200 : 300;
//       _width = _width == 500 ? 200 : 500;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Earn Chance to Win Free Dessert",
//           style: kAppBarTextStyle,
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: displayedDessert.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Center(
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 500),
//                       color: kGreen,
//                       height: _height,
//                       width: _width,
//                       child: Center(
//                         child: Text(displayedDessert[index].dessertName),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 300.0,
//               vertical: 50.0,
//             ),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: kLightGreen,
//               ),
//               onPressed: () {
//                 _updateState();
//               },
//               child: Container(
//                 height: 60,
//                 width: 350,
//                 child: Center(
//                   child: Text(
//                     "TRY",
//                     style: TextStyle(
//                       fontSize: 30,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class SpinningWheel extends StatefulWidget {
  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
{
  int selected = 0;
  @override
  Widget build(BuildContext context) {

    final items = <String>[
      'Free Dessert! ',
      'Sorry, Try again ',
      'So Close! ',
    ];

    final int rotationCount = 4;
    
    
    return Scaffold(

      appBar: AppBar(
         title: Text("Free Dessert"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {

            selected = Random().nextInt(items.length);
            if (selected == 0)
              {
                print("Free Dessert!");
              }
          });
        },
        child: Column(
          children: [
            Expanded(
                flex:2,
                child: FortuneWheel(
                  selected: selected,
                  items: [
                    for (var it in items ) FortuneItem(child: Text(it))
                  ],
                )
            ),
          ],
        )
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Free Dessert"),
    //   ),
    //   body: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget> [
    //         CustomButton(
    //           label: "Claim!";
    //
    //        ),
    //       ],
    //   ),
    // );




  }
}

