import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

class StyledText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;

  const StyledText({
    @required this.text,
    this.style,
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle customStyle = TextStyle(
      color: kWhite,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ).merge(style);

    return Text(
      text,
      style: customStyle,
      textAlign: align,
    );
  }
}
