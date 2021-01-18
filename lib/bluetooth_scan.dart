import 'dart:async';

import 'package:bitirme/main.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart' as bs;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BluetoothCihazSecimPage extends StatefulWidget {
  BluetoothCihazSecimPage();
  @override
  _BluetoothCihazSecimPageState createState() =>
      _BluetoothCihazSecimPageState();
}

class _BluetoothCihazSecimPageState extends State<BluetoothCihazSecimPage> {
  List<bs.BluetoothDevice> connDev = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
  }

  Future<void> initBluetooth() async {
    List<bs.BluetoothDevice> devTemp =
        await bs.FlutterBluetoothSerial.instance.getBondedDevices();
    devTemp.forEach((element) {
      connDev.add(element);
    });
    setState(() {});
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cihaz Seçin'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text("${connDev.elementAt(index).name}"),
            subtitle: Text("${connDev.elementAt(index).address}"),
            onTap: () async {
              var device = connDev.elementAt(index);
              Get.to(Sayfa(
                adres: device.address,
              ));
            },
          ),
          itemCount: connDev.length,
        ),
      ),
    );
  }
}
