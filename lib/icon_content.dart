import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String gender;

  IconContent({
    this.gender = 'MALE',
    this.iconName = FontAwesomeIcons.mars,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        iconName,
        size: 80.0,
      ),
      const SizedBox(
        height: 10.0,
      ),
      Text(
        gender,
        style: klabelTextStyle,
      ),
    ]);
  }
}
