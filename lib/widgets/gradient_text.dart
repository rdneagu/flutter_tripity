import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';
import 'package:flutter_tripity/widgets/styled_text.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Color color;
  final List<Color> colors;
  final TextStyle style;
  final TextAlign align;

  const GradientText({
    @required this.text,
    this.color,
    this.colors = kNavigationBarSelectedGradient,
    this.style,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle customStyle = TextStyle(
      color: color ?? colors[1],
      fontWeight: FontWeight.bold,
    ).merge(style);

    return LinearGradientMask(
      child: StyledText(
        text: text,
        style: customStyle,
        align: align,
      ),
      begin: Alignment(0.0, -3.0),
      end: Alignment.bottomCenter,
      colors: colors,
    );
  }
}
