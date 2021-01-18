import 'dart:convert';

import 'package:bitirme/bluetooth_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: BluetoothCihazSecimPage(),
    ),
  );
}

class Sayfa extends StatelessWidget {
  Sayfa({this.adres});
  String adres;
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
                BluetoothConnection connection =
                    await BluetoothConnection.toAddress(adres);
                var mesaj = utf8.encode('baslat');
                connection.output.add(mesaj);
                connection.finish();
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
                BluetoothConnection connection =
                    await BluetoothConnection.toAddress(adres);
                var mesaj = utf8.encode('durdur');
                connection.output.add(mesaj);
                connection.finish();
              },
            ),
          ),
        ],
      ),
    );
  }
}
