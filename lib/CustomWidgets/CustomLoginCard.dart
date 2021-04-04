import 'package:flutter/material.dart';
import '../Data/constants.dart';

class CustomLoginCard extends StatefulWidget {
  final String label;
  final Function cardTapped;
  final IconData icon;

  CustomLoginCard({this.label, this.cardTapped, this.icon});

  @override
  _CustomLoginCardState createState() => _CustomLoginCardState();
}

class _CustomLoginCardState extends State<CustomLoginCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 100, right: 100),
      child: ElevatedButton(
        onPressed: () {
          widget.cardTapped();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kOffWhite),
          elevation: MaterialStateProperty.all(4.0),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Icon(
                widget.icon,
                size: 45,
                color: kGreen,
              ),
            ),
            Container(
              height: 100,
              child: Center(
                child: Text(
                  widget.label,
                  style: kLoginCardTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
