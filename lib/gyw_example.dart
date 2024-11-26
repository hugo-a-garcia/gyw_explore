import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart' as gyw;

import 'model/icon_drawing.dart';
import 'model/slides.dart';
import 'model/text_drawing.dart';
import 'model/blank_screen_gyw.dart';

class GYWExampleScreen extends StatefulWidget {
  const GYWExampleScreen({super.key});

  @override
  State<GYWExampleScreen> createState() => _GYWExampleScreenState();
}

class _GYWExampleScreenState extends State<GYWExampleScreen> {
  gyw.GYWBtDevice? connectedDevice;

  Future<void> _scanForDevice() async {
    try {
      await gyw.GYWBtManager.instance.refreshDevices();
    } on gyw.GYWStatusException catch (e, s) {
      log("Impossible to scan", error: e, stackTrace: s);
    }

    setState(() {});
  }

  Future<void> _sendExampleData() async {
    // Using thhe the data Model.
    Slides slides = Slides(drawings: <gyw.GYWDrawing>[
      BlankScreen(color: Colors.white),
      IconDrawing(gyw.GYWIcon.up, top: 50, left: 60),
      TextDrawing(
        text: "Hello world",
        top: 50,
        left: 220,
        font: gyw.GYWFont.medium,
      ),
    ], name: 'Hello World');

    //Print the model as JSON
    final jasonMap = slides.toJson();
    final encodedJason = jsonEncode(jasonMap);
    print(encodedJason);

    for (final gyw.GYWDrawing drawing in slides.drawings) {
      print(">>>>>>>>>>>>>>>>  SENDING DRAWING\n");
      //await connectedDevice?.displayDrawing(drawing);
      await connectedDevice?.sendDrawing(drawing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _scanForDevice,
              child: const Text("Search devices"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: ListView.builder(
              itemCount: gyw.GYWBtManager.instance.devices.length,
              itemBuilder: (_, index) {
                final gyw.GYWBtDevice device =
                    gyw.GYWBtManager.instance.devices[index];
                return ListTile(
                  title: Text(
                    device.name.isEmpty ? "Unknown device" : device.name,
                    style: TextStyle(
                      fontWeight: device.id == connectedDevice?.id
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                  subtitle: Text(device.id),
                  onTap: () async {
                    if (await device.connect()) {
                      await device.startDisplay();
                      setState(() => connectedDevice = device);
                    }
                  },
                  onLongPress: () async {
                    if (await device.disconnect()) {
                      setState(() => connectedDevice = null);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: connectedDevice == null ? null : _sendExampleData,
              child: const Text("Send data"),
            ),
          ),
        ],
      ),
    );
  }
}
