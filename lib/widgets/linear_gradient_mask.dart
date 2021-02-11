import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

class LinearGradientMask extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  final Widget child;

  const LinearGradientMask({
    @required this.child,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.colors = kNavigationBarSelectedGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
