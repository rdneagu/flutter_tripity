import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    @required this.items,
    this.currentIndex = 0,
    @required this.onTap,
  }) : assert(items != null);

  @override
  CustomBottomNavigationBarState createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget get getItemsWidget {
    List<Widget> items = [];
    for (int i = 0; i < widget.items.length; i++) {
      Widget item = CustomBottomNavigationBarItem(
        id: i,
        label: widget.items[i]['label'],
        icon: widget.items[i]['icon'],
        selected: i == widget.currentIndex,
        onTap: widget.onTap,
      );
      items.add(item);
    }
    return Container(
      decoration: BoxDecoration(
        color: kNavigationBarColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getItemsWidget;
  }
}
