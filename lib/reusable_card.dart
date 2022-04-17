import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColour;
  final Widget cardChild;
  final VoidCallback? onPress;

  const ReusableCard(
      {@required this.cardColour = const Color(0xFF1D1E33),
      this.cardChild = const Text('Empty Child Here'),
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
