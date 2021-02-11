import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final List<Color> colors;
  final double size;

  const GradientIcon({
    @required this.icon,
    this.color,
    this.colors = kNavigationBarSelectedGradient,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LinearGradientMask(
      child: Icon(
        icon,
        color: color ?? colors[1],
        size: size,
      ),
      colors: colors,
    );
  }
}
