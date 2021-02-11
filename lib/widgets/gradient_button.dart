import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

class GradientButton extends StatelessWidget {
  final List<Color> colors;
  final Color textColor;
  final IconData icon;
  final String text;
  final Function() onTap;

  const GradientButton({
    this.colors = kNavigationBarSelectedGradient,
    this.textColor = kWhite,
    this.icon,
    @required this.text,
    @required this.onTap,
  })  : assert(text != null),
        assert(onTap != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        shadows: <BoxShadow>[
          BoxShadow(
            blurRadius: 1,
            color: Colors.black,
            offset: Offset(0.0, 1.0),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1.0, 5.0),
          colors: colors,
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
        textColor: textColor,
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(icon, size: 12.0),
              ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: colors,
  //       ),
  //     ),
  //     child: MaterialButton(
  //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //       padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text('test'),
  //         ],
  //       ),
  //       onPressed: onTap,
  //     ),
  //   );
  // }
}
