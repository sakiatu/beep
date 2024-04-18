import 'package:flutter/material.dart';

class GapXY extends SizedBox {
  const GapXY([double x = 16, double y = 16]) : super(width: x, height: y, key: null);
}

class GapX extends GapXY {
  const GapX([double x = 16]) : super(x, 0);
}

class GapY extends GapXY {
  const GapY([double y = 16]) : super(0, y);
}
