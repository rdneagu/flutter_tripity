import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/screens/authentication/widgets/clippers/index.dart';
import 'package:flutter_tripity/screens/authentication/widgets/Header.dart';
import 'package:flutter_tripity/screens/authentication/widgets/LoginForm.dart';

class AuthenticationScreen extends StatefulWidget {
  final double screenHeight;

  const AuthenticationScreen({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<AuthenticationScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _blueTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;
  Animation<double> _formElementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.7, 1.0, curve: Curves.easeInOut),
    ));

    var clipperOffsetTween = Tween<double>(begin: widget.screenHeight, end: 0.0);
    _whiteTopClipperAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.5, 0.7, curve: Curves.easeInOut),
    ));
    _greyTopClipperAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.7, curve: Curves.easeInOut),
    ));
    _blueTopClipperAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.2, 0.7, curve: Curves.easeInOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            child: Container(color: kLightBlue),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: WhiteTopClipper(yOffset: _whiteTopClipperAnimation.value),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            child: Container(color: kBlue),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: GreyTopClipper(yOffset: _greyTopClipperAnimation.value),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            child: Container(color: kWhite),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: BlueTopClipper(yOffset: _blueTopClipperAnimation.value),
                child: child,
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: <Widget>[
                  Header(animation: _headerTextAnimation),
                  SizedBox(height: 200),
                  LoginForm(context: context, animation: _formElementAnimation),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
