import 'package:flutter/material.dart';

import 'loading_effect.dart';

extension WidgetExtension on Widget {
  Widget center() => Center(child: this);

  Widget expand([int flex = 1]) => Expanded(flex: flex, child: this);

  Widget opacity([double opacity = 1]) => Opacity(opacity: opacity, child: this);

  Widget visible([bool visible = true]) => Visibility(visible: visible, child: this);

  Widget align([Alignment alignment = Alignment.centerLeft]) => Align(alignment: alignment, child: this);

  Widget loadingEffect() => LoadingEffectWidget(child: this);

  Widget onTap(void Function()? onTap) => GestureDetector(onTap: onTap, child: this);

  Widget scrollable([Axis direction = Axis.vertical]) => SingleChildScrollView(scrollDirection: direction, child: this);

  Widget paddingLTRB({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      Padding(padding: EdgeInsets.only(left: l, top: t, right: r, bottom: b), child: this);

  Widget paddingY([double y = 16]) => paddingLTRB(t: y, b: y);

  Widget paddingX([double x = 16]) => paddingLTRB(l: x, r: x);

  Widget paddingXY([double x = 16, double y = 16]) => paddingLTRB(l: x, t: y, r: x, b: y);

  Widget paddingLeft([double n = 16]) => paddingLTRB(l: n);

  Widget paddingRight([double n = 16]) => paddingLTRB(r: n);

  Widget paddingTop([double n = 16]) => paddingLTRB(t: n);

  Widget paddingBottom([double n = 16]) => paddingLTRB(b: n);
}
