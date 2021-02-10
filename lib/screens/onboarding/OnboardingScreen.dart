import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/mobx/index.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/screens/onboarding/pages/community/index.dart';
import 'package:flutter_tripity/screens/onboarding/pages/education/index.dart';
import 'package:flutter_tripity/screens/onboarding/pages/OnboardingPage.dart';
import 'package:flutter_tripity/screens/onboarding/pages/work/index.dart';
import 'package:flutter_tripity/screens/onboarding/widgets/Header.dart';
import 'package:flutter_tripity/screens/onboarding/widgets/NextPageButton.dart';
import 'package:flutter_tripity/screens/onboarding/widgets/OnboardingPageIndicator.dart';
import 'package:flutter_tripity/screens/onboarding/widgets/Ripple.dart';

class OnboardingScreen extends StatefulWidget {
  final double screenHeight;

  const OnboardingScreen({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingScreen> with TickerProviderStateMixin {
  AnimationController _pageIndicatorAnimationController;
  AnimationController _cardsAnimationController;
  AnimationController _rippleAnimationController;

  Animation<Offset> _slideAnimationLightCard;
  Animation<Offset> _slideAnimationDarkCard;
  Animation<double> _pageIndicatorAnimation;
  Animation<double> _rippleAnimation;

  int _currentPage = 1;
  int _maxPages = 3;

  /* Getters */
  bool get isFirstPage => _currentPage == 1;

  /* Life-Cycle */
  @override
  void initState() {
    super.initState();
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: kButtonAnimationDuration,
    );
    _setPageIndicatorAnimation();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: kCardAnimationDuration,
    );
    _setCardsSlideOutAnimation();
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );
    _setRippleAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    int multiplicator = 2;
    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));

      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));

      _cardsAnimationController.reset();
    });
  }

  void _setRippleAnimation() {
    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));

      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));

      _cardsAnimationController.reset();
    });
  }

  /* Functions */
  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          lightCardChild: CommunityLightCard(),
          darkCardChild: CommunityDarkCard(),
          textColumn: CommunityTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 2:
        return OnboardingPage(
          number: 2,
          lightCardChild: EducationLightCard(),
          darkCardChild: EducationDarkCard(),
          textColumn: EducationTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 3:
        return OnboardingPage(
          number: 3,
          lightCardChild: WorkLightCard(),
          darkCardChild: WorkDarkCard(),
          textColumn: WorkTextColumn(),
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setNextPage() {
    setState(() {
      _currentPage++;
    });
  }

  Future<void> _nextPage() async {
    store.userStore.setUser();
    if (_currentPage == _maxPages) {
      if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
        await _goToLogin();
      }
    } else {
      if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
        _pageIndicatorAnimationController.forward();
        await _cardsAnimationController.forward();
        _setNextPage();
        _setCardsSlideInAnimation();
        await _cardsAnimationController.forward();
        if (_currentPage < _maxPages) {
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
      }
    }
  }

  Future<void> _goToLogin() async {
    await _rippleAnimationController.forward();
    Navigator.of(context).pushReplacementNamed('/authentication');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Column(
                children: <Widget>[
                  Header(
                    onSkip: () async => await _goToLogin(),
                  ),
                  Expanded(
                    child: _getPage(),
                  ),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    child: NextPageButton(
                      onPressed: () async => await _nextPage(),
                    ),
                    builder: (_, Widget child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget child) {
              return Ripple(
                radius: _rippleAnimation.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
