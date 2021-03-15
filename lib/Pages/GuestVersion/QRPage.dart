import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_restaurant/Data/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';




class QR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Dessert Code: 123456"), // <- If we have time make this randomized
      ),
      //body: Column(
      body: QrImage(
            data: 'This the free dessert QR Code for Winners!',
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          ),
      );
    //);
  }
}
