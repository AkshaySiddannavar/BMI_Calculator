import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({this.height = 0, this.weight = 0});

  String calculateBMI() {
    double bmi = 10000 * (weight / (height * height));
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    double bmi = 10000 * (weight / (height * height));
    final int bmi_int = bmi.toInt();
    if (bmi_int >= 25) {
      return 'Overweight';
    } else if (bmi_int >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    double bmi = 10000 * (weight / (height * height));
    int bmi_int = bmi.toInt();
    if (bmi_int >= 25) {
      return 'Looks like someone\'s overweight \n      Time for exercise Mate!';
    } else if (bmi_int >= 18.5) {
      return 'Cheers for your Health! :)';
    } else {
      return 'You are underweight \n Eat More Eat Healthy';
    }
  }
}
