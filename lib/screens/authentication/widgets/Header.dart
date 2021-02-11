import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/widgets/logo.dart';
import 'package:flutter_tripity/screens/authentication/widgets/FadeSlideTransition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({
    @required this.animation,
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Logo(size: 48.0),
          const SizedBox(height: kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Welcome to Tripity',
              style: Theme.of(context).textTheme.headline5.copyWith(color: kWhite, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Join us and start tracking your trips',
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: kWhite.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
