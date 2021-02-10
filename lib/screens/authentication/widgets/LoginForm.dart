import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/screens/authentication/widgets/Button.dart';
import 'package:flutter_tripity/screens/authentication/widgets/InputField.dart';
import 'package:flutter_tripity/screens/authentication/widgets/FadeSlideTransition.dart';

class LoginForm extends StatelessWidget {
  final BuildContext context;
  final Animation<double> animation;

  const LoginForm({
    @required this.context,
    @required this.animation,
  }) : assert(animation != null);

  void _authenticate() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: InputField(
              label: 'Username or Email',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: InputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: Button(
              color: kBlue,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: _authenticate,
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: Button(
              color: kBlack,
              textColor: kWhite,
              text: 'Create a Tripity Account',
              onPressed: _authenticate,
            ),
          ),
        ],
      ),
    );
  }
}
