import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/gradient_button.dart';
import 'package:flutter_tripity/screens/authentication/widgets/input_field.dart';
import 'package:flutter_tripity/screens/authentication/widgets/FadeSlideTransition.dart';
import 'package:flutter_tripity/widgets/gradient_text.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeSlideTransition(
                  animation: animation,
                  additionalOffset: 0.0,
                  child: InputField(
                    label: 'USERNAME',
                    icon: Icons.person,
                  ),
                ),
                SizedBox(height: space),
                FadeSlideTransition(
                  animation: animation,
                  additionalOffset: space,
                  child: InputField(
                    label: 'PASSWORD',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 4 * space),
                FadeSlideTransition(
                  animation: animation,
                  additionalOffset: 4 * space,
                  child: GradientButton(
                    text: 'Login',
                    icon: Icons.arrow_forward_ios,
                    onTap: _authenticate,
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: kDarkestBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GradientText(text: 'Forgot Password'),
                SizedBox(height: 4.0),
                GradientText(text: 'Create new account'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
