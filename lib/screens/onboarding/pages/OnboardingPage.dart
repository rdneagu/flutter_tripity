import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/screens/onboarding/widgets/CardsStack.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Widget textColumn;

  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  const OnboardingPage({
    @required this.number,
    @required this.lightCardChild,
    @required this.darkCardChild,
    @required this.textColumn,
    @required this.lightCardOffsetAnimation,
    @required this.darkCardOffsetAnimation,
  })  : assert(number != null),
        assert(lightCardChild != null),
        assert(darkCardChild != null),
        assert(textColumn != null),
        assert(lightCardOffsetAnimation != null),
        assert(darkCardOffsetAnimation != null);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardsStack(
        pageNumber: number,
        lightCardChild: lightCardChild,
        darkCardChild: darkCardChild,
        lightCardOffsetAnimation: lightCardOffsetAnimation,
        darkCardOffsetAnimation: darkCardOffsetAnimation,
      ),
      SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
      AnimatedSwitcher(
        duration: kCardAnimationDuration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: textColumn,
      )
    ]);
  }
}
