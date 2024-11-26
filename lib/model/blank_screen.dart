import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';

/// A drawing to reset the content of the screen and its background color
class BlankScreen extends GYWDrawing {
  /// The type of the [BlankScreen] drawing
  static const String type = "blank_screen";

  /// The background color. If null, the screen will be cleared with the latest background color used.
  final Color? color;

  const BlankScreen({this.color});

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.clear.value));

    if (color != null) {
      // Add color value
      controlBytes.add(utf8.encode(hexFromColor(color!)));
    }

    return [
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  // @override
  // String toString() {
  //   return "Drawing: blank screen $color";
  // }

  // /// Deserializes a [BlankScreen] from JSON data
  // factory BlankScreen.fromJson(Map<String, dynamic> data) {
  //   return BlankScreen(
  //     color: colorFromHex(data["color"] as String?),
  //   );
  // }

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     "type": type,
  //     "color": color != null ? hexFromColor(color!) : null,
  //   };
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (other is BlankScreen) {
  //     return color?.value == other.color?.value;
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // int get hashCode => 23 * color.hashCode;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}