import 'package:flutter/material.dart';

class Label extends Text {
  const Label(
    String? label, {
    bool wrap = true,
    super.key,
    super.style,
    super.maxLines,
    super.textAlign,
  }) : super('$label', overflow: wrap ? TextOverflow.ellipsis : null);
}