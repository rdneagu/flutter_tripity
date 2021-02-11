import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/linear_gradient_mask.dart';
import 'package:flutter_tripity/widgets/gradient_text.dart';
import 'package:flutter_tripity/widgets/gradient_icon.dart';

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
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -1.5),
            radius: 0.6,
            colors: kNavigationBarSelectedGlow,
          ),
        ),
      ),
    );
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
        GradientIcon(icon: icon),
        GradientText(text: label),
      ];
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: inner,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        overflow: Overflow.clip,
        children: [
          if (selected) renderItemGlow,
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              child: renderItemButton,
              onTap: () => onTap(id),
            ),
          ),
        ],
      ),
    );
  }
}
