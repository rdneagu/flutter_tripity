import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_tripity/constants.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Widget image;
  final VoidCallback onPressed;

  const Button({
    @required this.color,
    @required this.textColor,
    @required this.text,
    @required this.onPressed,
    this.image,
  })  : assert(color != null),
        assert(textColor != null),
        assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child: image != null
          ? OutlineButton(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: kPaddingL),
                    child: image,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: textColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: onPressed,
            )
          : FlatButton(
              color: color,
              padding: const EdgeInsets.all(kPaddingM),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.subtitle1.copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              onPressed: onPressed,
            ),
    );
  }
}
