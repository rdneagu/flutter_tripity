// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/widgets/gradient_text.dart';
import 'package:flutter_tripity/widgets/gradient_icon.dart';

import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({
    @required this.size,
  }) : assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GradientIcon(
          icon: Icons.explore_outlined,
          size: size,
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: GradientText(
            text: 'Tripity',
            style: TextStyle(fontSize: size / 2),
          ),
        ),
      ],
    );
  }
}
