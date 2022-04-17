import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            color: Color(0xFF0B0A1A),
          ),
          primaryColor: const Color(0xFF0B0A1A),
          scaffoldBackgroundColor: const Color(0xFF0F0F1E),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kactiveCardColor,
          )),
      home: InputPage(),
    );
  }
}
