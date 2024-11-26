// blank_screen.dart
// 1. import freezed_annotation
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. add 'part' files
part 'blank_screen.freezed.dart';
part 'blank_screen.g.dart';

// 3. add @freezed annotation
@freezed
// 4. define a class with a mixin
class BlankScreen with _$BlankScreen {
  //4.1 define a private contructor to force extend and not implement
  const BlankScreen._();
  // 5. define a factory constructor
  // 5.1 Add the implementation of the abstract class GYWDrawing

  final int top = 0;
  final int left = 0;

  @Implements<GYWDrawing>()
  factory BlankScreen(
      {
      // 6. list all the arguments/properties
     Color? color,
      // 7. assign it with the `_BlankScreen` class constructor
      }) = _BlankScreen;

  // 8. define another factory constructor to parse from json
  factory BlankScreen.fromJson(Map<String, dynamic> json) =>
      _$BlankScreenFromJson(json);
      
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
}
