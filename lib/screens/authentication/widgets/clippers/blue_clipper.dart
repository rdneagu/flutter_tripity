import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlueClipper extends CustomClipper<Path> {
  final double yOffset;

  const BlueClipper({
    @required this.yOffset,
  }) : assert(yOffset != null);

  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 245.0 + yOffset)
      ..quadraticBezierTo(
        size.width / 2,
        265.0 + yOffset,
        size.width,
        175.0 + yOffset,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
