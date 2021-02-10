import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';
import 'package:flutter_tripity/widgets/bottom_navigation_bar.dart';
import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentTabIndex;
  List<Map<String, dynamic>> _tabItems = [
    {'label': "Home", 'icon': Icons.home},
    {'label': "Trips", 'icon': Icons.business},
    {'label': "Tab3", 'icon': Icons.web},
    {'label': "Tab4", 'icon': Icons.anchor},
  ];

  @override
  void initState() {
    super.initState();
    _currentTabIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateTabIndex(i) {
    setState(() {
      _currentTabIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: kNavigationBarColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  ),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Center(
                        child: LinearGradientMask(
                          child: Text(
                            _tabItems[_currentTabIndex]["label"],
                            style: TextStyle(color: kNavigationBarSelectedGradient[1], fontWeight: FontWeight.w600, fontSize: 20.0),
                          ),
                          begin: Alignment(0.0, -3),
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    )
                  ]),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Text('content')),
                    ],
                  ),
                ),
                CustomBottomNavigationBar(items: _tabItems, currentIndex: _currentTabIndex, onTap: _updateTabIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
