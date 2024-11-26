import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';

/// A drawing to display an icon on an aRdent device
class IconDrawing extends GYWDrawing {
  /// The type of the [IconDrawing]
  static const String type = "icon";

  /// whether the drawings uses a icon that is not part of the library
  bool get isCustom => icon == null;

  /// The filename of the icon.
  String get iconFilename => icon?.filename ?? customIconFilename!;

  /// The displayed [GYWIcon]
  final GYWIcon? icon;

  /// If [icon] is null, this is a custom icon the library doesn't know about.
  ///
  /// The name of this icon will be stored in this field instead.
  final String? customIconFilename;

  /// Hexadecimal code of the icon fill color
  final Color color;

  /// The icon scaling factor.
  ///
  /// Minimum is 0.01, maximum is 13.7.
  final double scale;

  IconDrawing(
    GYWIcon this.icon, {
    top,
    left,
    this.color = Colors.black,
    this.scale = 1.0,
  }) : customIconFilename = null;

  /// Creates a custom icon, i.e. an icon whose image is not in the library
  IconDrawing.custom(
    String this.customIconFilename, {
    top,
    left,
    this.color = Colors.black,
    this.scale = 1.0,
  }) : icon = null;

  @override
  List<GYWBtCommand> toCommands() {
    final controlBytes = BytesBuilder();
    controlBytes.add(int8Bytes(GYWControlCode.displayImage.value));
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));
    controlBytes.add(utf8.encode(hexFromColor(color)));
    controlBytes.add(byteFromScale(scale));

    return <GYWBtCommand>[
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert(
          isCustom ? iconFilename : "$iconFilename.svg",
        ),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  // @override
  // String toString() {
  //   return "Drawing: ${icon?.name ?? customIconFilename} at ($left, $top)";
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (other is IconDrawing) {
  //     return iconFilename == other.iconFilename &&
  //         color.value == other.color.value &&
  //         left == other.left &&
  //         top == other.top &&
  //         scale == other.scale;
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // int get hashCode => Object.hash(
  //       iconFilename,
  //       left,
  //       top,
  //       color,
  //       scale,
  //     );

  // /// Deserializes an [IconDrawing] from JSON data
  // factory IconDrawing.fromJson(Map<String, dynamic> data) {
  //   // Deprecated "icon" key will be deprecated in future versions
  //   final String icon = data["data"] as String? ?? data["icon"] as String;

  //   final GYWIcon? gywIcon = GYWIcon.values.cast<GYWIcon?>().firstWhere(
  //         (element) => element!.filename == icon || element.name == icon,
  //         orElse: () => null,
  //       );

  //   if (gywIcon != null) {
  //     return IconDrawing(
  //       gywIcon,
  //       left: data["left"] as int,
  //       top: data["top"] as int,
  //       color: colorFromHex(data["color"] as String?) ?? Colors.black,
  //       scale: (data["scale"] as num? ?? 1.0).toDouble(),
  //     );
  //   } else {
  //     return IconDrawing.custom(
  //       icon,
  //       left: data["left"] as int,
  //       top: data["top"] as int,
  //       color: colorFromHex(data["color"] as String?) ?? Colors.black,
  //       scale: (data["scale"] as num? ?? 1.0).toDouble(),
  //     );
  //   }
  // }

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     "type": type,
  //     "left": left,
  //     "top": top,
  //     // Deprecated: "icon" key will be deprecated in future versions
  //     "icon": icon?.name ?? customIconFilename,
  //     "data": iconFilename,
  //     "color": hexFromColor(color),
  //     "scale": scale,
  //   };
  // }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
