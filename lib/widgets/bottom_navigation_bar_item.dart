import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final int id;
  final IconData icon;
  final String label;
  final bool selected;
  final Function(int) onTap;

  CustomBottomNavigationBarItem({
    @required this.id,
    @required this.icon,
    @required this.label,
    this.selected = false,
    @required this.onTap,
  });

  Widget get renderItemGlow {
    if (selected) {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.0, -2.0),
              radius: 0.8,
              colors: kNavigationBarSelectedGlow,
            ),
          ),
        ),
      );
    }
    return Positioned(child: Container());
  }

  Widget get renderItemButton {
    List<Widget> inner = [
      Icon(icon, color: kWhite),
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: kWhite),
      ),
    ];
    if (selected) {
      inner = [
        LinearGradientMask(child: Icon(icon, color: kNavigationBarSelectedGradient[1])),
        LinearGradientMask(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: kNavigationBarSelectedGradient[1], fontWeight: FontWeight.w600),
          ),
          begin: Alignment(0.0, -1.5),
          end: Alignment.bottomCenter,
        ),
      ];
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: inner,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          renderItemGlow,
          Align(
            alignment: Alignment.center,
            child: RawMaterialButton(
              child: renderItemButton,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () => onTap(id),
            ),
          ),
        ],
      ),
    );
  }
}
