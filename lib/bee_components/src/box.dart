import 'package:flutter/material.dart';

class Box extends Card {
  Box({
    double paddingX = 16,
    double paddingY = 16,
    double radius = 8,
    double stroke = 0,
    Color strokeColor = Colors.transparent,
    double maxHeight = double.infinity,
    double maxWidth = double.infinity,
    double minHeight = 0,
    double minWidth = 0,
    double? height,
    double? width,
    super.key,
    super.color = Colors.transparent,
    super.elevation = 0,
    required Widget child,
  }) : super(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius), side: BorderSide(width: stroke, color: strokeColor)),
            child: Container(
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                constraints:
                    BoxConstraints(minHeight: minHeight, maxHeight: maxHeight, maxWidth: maxWidth, minWidth: minWidth),
                child: child));
}
