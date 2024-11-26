import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';

/// A drawing to display text on an aRdent device
class TextDrawing extends GYWDrawing {
  /// The type of the [TextDrawing] drawing
  static const String type = "text";

  /// The text that must be displayed
  final String text;

  /// Returns the text wrapped on multiple lines constrained by [maxWidth] and [maxLines].
  String get wrappedText => _wrapText().join("\n");

  /// The [GYWFont] to use
  ///
  /// If no font is given, it uses the most recent one
  final GYWFont? font;

  /// The text size. Overrides the font size.
  final int? size;

  /// The color of the text.
  final Color color;

  /// The maximum width (in pixels) of the text.
  ///
  /// It will be wrapped on multiple lines if it is too long.
  final int? maxWidth;

  /// The maximum number of lines the text can be wrapped on.
  ///
  /// All extra lines will be ignored.
  /// The value 0 is special and disables the limit.
  final int maxLines;

  const TextDrawing({
    required this.text,
    this.font,
    this.size,
    this.color = Colors.black,
    this.maxWidth,
    this.maxLines = 1,
    super.left = 0,
    super.top = 0,
  });

  @override
  List<GYWBtCommand> toCommands() {
    final int fontSize = size ?? font?.size ?? GYWFont.small.size;
    final int charHeight = (fontSize * 1.33).ceil();

    final List<GYWBtCommand> commands = [];

    int currentTop = top;
    for (final String line in _wrapText()) {
      commands.addAll(_lineToCommands(line, currentTop));
      currentTop += charHeight;
    }
    return commands;
  }

  Iterable<String> _wrapText() sync* {
    // An invalid value will be considered as unconstrained.
    final int? maxWidth =
        this.maxWidth != null && this.maxWidth! < 1 ? null : this.maxWidth;

    final int maxLines = max(0, this.maxLines);

    int textWidth;
    final int availableWidth = GYWScreenParameters.width - left;
    if (maxWidth == null || maxWidth >= availableWidth) {
      // Never let the text overflow the screen on width.
      textWidth = availableWidth;
    } else {
      textWidth = maxWidth;
    }

    final int fontSize = size ?? font?.size ?? GYWFont.small.size;
    final int charWidth = (fontSize * 0.6).ceil();
    final int maxCharsPerLine = textWidth ~/ charWidth;

    final List<String> words = text.split(" ");
    int lines = 0;
    final line = StringBuffer();

    for (final String word in words) {
      if (line.isNotEmpty && line.length + 1 + word.length > maxCharsPerLine) {
        yield line.toString();
        lines++;
        if (maxLines != 0 && lines >= maxLines) {
          return;
        }
        line.clear();
        line.write(word);
      } else {
        line.write(line.isEmpty ? word : " $word");
      }
    }
    yield line.toString();
  }

  List<GYWBtCommand> _lineToCommands(String line, int top) {
    // Bytes generation for the control data (command code + params)
    final controlBytes = BytesBuilder();

    controlBytes.add(int8Bytes(GYWControlCode.displayText.value));
    controlBytes.add(int32Bytes(left));
    controlBytes.add(int32Bytes(top));

    controlBytes.add(utf8.encode(font?.prefix ?? "NUL"));
    controlBytes.add(int8Bytes(size ?? 0));

    final shortColor = [color.alpha, color.red, color.green, color.blue]
        .map((channel) => (channel ~/ 16).toRadixString(16))
        .join();

    controlBytes.add(utf8.encode(shortColor));

    return [
      GYWBtCommand(
        GYWCharacteristic.nameDisplay,
        const Utf8Encoder().convert(line),
      ),
      GYWBtCommand(
        GYWCharacteristic.ctrlDisplay,
        controlBytes.toBytes(),
      ),
    ];
  }

  // @override
  // String toString() {
  //   return "Drawing: Text $text at ($left, $top)";
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (other is TextDrawing) {
  //     return text == other.text &&
  //         left == other.left &&
  //         top == other.top &&
  //         font == other.font &&
  //         size == other.size &&
  //         color.value == other.color.value &&
  //         maxWidth == other.maxWidth &&
  //         maxLines == other.maxLines;
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // int get hashCode => Object.hash(
  //       text,
  //       font,
  //       left,
  //       top,
  //       size,
  //       color,
  //       maxWidth,
  //       maxLines,
  //     );

  // /// Deserializes a [TextDrawing] from JSON data
  // factory TextDrawing.fromJson(Map<String, dynamic> data) {
  //   GYWFont? font;
  //   try {
  //     font = GYWFont.values.firstWhere(
  //       (e) => e.index == data["font"] || e.name == data["font"],
  //     );
  //   } on StateError {
  //     font = null;
  //   }

  //   return TextDrawing(
  //     left: data["left"] as int,
  //     top: data["top"] as int,
  //     // Deprecated: "text" key will be deprecated in future version
  //     text: data["data"] as String? ?? data["text"] as String,
  //     font: font,
  //     size: data["size"] as int?,
  //     color: colorFromHex(data["color"] as String?) ?? Colors.black,
  //     maxWidth: data["max_width"] as int?,
  //     maxLines: data["max_lines"] as int? ?? 1,
  //   );
  // }

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     "type": type,
  //     "left": left,
  //     "top": top,
  //     "data": text,
  //     // Deprecated: "text" key will be deprecated in future version
  //     "text": text,
  //     if (font != null) "font": font!.index,
  //     "size": size,
  //     "color": hexFromColor(color),
  //     "max_width": maxWidth,
  //     "max_lines": maxLines,
  //   };
  // }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}