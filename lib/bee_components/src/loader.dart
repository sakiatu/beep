import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double? size;
  final double stroke;
  final Color? color;

  const Loader({this.size, this.stroke = 4.0, this.color, super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(height: size, width: size, child: CircularProgressIndicator(strokeWidth: stroke, color: color)),
      );
}

class LoaderScaffold extends StatelessWidget {
  final double? size;
  final double stroke;
  final Color? color;

  const LoaderScaffold({this.size, this.stroke = 4.0, this.color, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Loader(size: size, stroke: stroke, color: color,key: key));
}
