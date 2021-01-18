import 'dart:convert';

import 'package:bitirme/bluetooth_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: BluetoothCihazSecimPage(),
    ),
  );
}

class Sayfa extends StatelessWidget {
  Sayfa({this.connec});
  var connec;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Komut Sayfası",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RaisedButton(
              child: Text(
                "Başla",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.green,
                ),
              ),
              onPressed: () async {
                var mesaj = utf8.encode('baslat');
                connec.output.add(mesaj);
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text(
                "Dur",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.red,
                ),
              ),
              onPressed: () async {
                var mesaj = utf8.encode('durdur');
                connec.output.add(mesaj);
              },
            ),
          ),
        ],
      ),
    );
  }
}
