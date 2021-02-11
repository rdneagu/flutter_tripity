import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/screens/home/HomeScreen.dart';
import 'package:flutter_tripity/screens/onboarding/OnboardingScreen.dart';
import 'package:flutter_tripity/screens/authentication/AuthenticationScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: kBlue,
          image: DecorationImage(
            image: AssetImage('assets/images/tripity_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Navigator(
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            Map<String, WidgetBuilder> builder = {
              '/': (BuildContext context) => OnboardingScreen(screenHeight: screenHeight),
              '/home': (BuildContext context) => HomeScreen(),
              '/authentication': (BuildContext context) => AuthenticationScreen(screenHeight: screenHeight),
            };

            if (!builder.containsKey(settings.name)) {
              throw Exception('Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder[settings.name], settings: settings);
          },
        ),
      ),
    );
  }
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tripity',
      theme: ThemeData(fontFamily: 'Nunito'),
      home: App(),
    );
  }
}

void main() {
  runApp(_App());
}
