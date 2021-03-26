import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';

class BottomNavBarItems extends StatelessWidget {
  final String label;
  final Function buttonTapped;

  BottomNavBarItems({@required this.label, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          buttonTapped();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 0.5)),
            color: kSemiLightGreen,
          ),
          height: 60,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 24, color: kSemiBlack),
            ),
          ),
        ),
      ),
    );
  }
}
