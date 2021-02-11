import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tripity/constants.dart';

import 'package:flutter_tripity/widgets/styled_text.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final String error;

  const InputField({
    @required this.label,
    @required this.icon,
    this.obscureText = false,
    this.error,
  })  : assert(label != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: kWhite)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 18.0, color: kWhite),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: StyledText(
                    text: label,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                      ),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      obscuringCharacter: '*',
                      obscureText: obscureText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Invalid username or password',
              style: TextStyle(
                color: kWhite,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kPaddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
          ),
        ),
        hintText: label,
        hintStyle: TextStyle(
          color: kBlack.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(0.5),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
