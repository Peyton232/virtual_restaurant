import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:custom_switch/custom_switch.dart';

const kSettingsHeaderTextStyle = TextStyle(
  fontSize: 30.0,
);

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _brightnessValue = 50;
  double _volumeValue = 40;
  double _fontSizeValue = 12;
  double _displaySizeValue = 12;
  bool _highContrastToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Brightness:",
                    style: kSettingsHeaderTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 25.0),
                ),
                Expanded(
                  child: Slider(
                    activeColor: kGreen,
                    inactiveColor: kMintGreen,
                    value: _brightnessValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _brightnessValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _brightnessValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  "100",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Volume:",
                    style: kSettingsHeaderTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 25.0),
                ),
                Expanded(
                  child: Slider(
                    activeColor: kGreen,
                    inactiveColor: kMintGreen,
                    value: _volumeValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _volumeValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _volumeValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  "100",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Font Size:",
                    style: kSettingsHeaderTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 25.0),
                ),
                Expanded(
                  child: Slider(
                    activeColor: kGreen,
                    inactiveColor: kMintGreen,
                    value: _fontSizeValue,
                    min: 0,
                    max: 30,
                    divisions: 5,
                    label: _fontSizeValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fontSizeValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  " 30 ",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Display Size:",
                    style: kSettingsHeaderTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 25.0),
                ),
                Expanded(
                  child: Slider(
                    activeColor: kGreen,
                    inactiveColor: kMintGreen,
                    value: _displaySizeValue,
                    min: 0,
                    max: 30,
                    divisions: 5,
                    label: _displaySizeValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _displaySizeValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  " 30 ",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "High Contrast Mode:",
                  style: kSettingsHeaderTextStyle,
                  textAlign: TextAlign.left,
                ),
                //TODO: Redo look of Switch. It looks weird
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Switch.adaptive(
                      activeColor: kGreen,
                      value: _highContrastToggle,
                      onChanged: (bool newValue) {
                        setState(() {
                          _highContrastToggle = newValue;
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
