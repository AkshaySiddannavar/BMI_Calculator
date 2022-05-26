import 'package:bmicalculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  int height = 180;
  int weight = 699;
  int age = 10;
  void updateColor(kGender selectedGender) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        maleCardColor = (maleCardColor == kinactiveCardColor)
                            ? kactiveCardColor
                            : kinactiveCardColor;
                        femaleCardColor = kinactiveCardColor;
                      });
                    },
                    cardColour: maleCardColor,
                    cardChild: IconContent(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        femaleCardColor =
                            (femaleCardColor == kinactiveCardColor)
                                ? kactiveCardColor
                                : kinactiveCardColor;
                        maleCardColor = kinactiveCardColor;
                      });
                    },
                    cardColour: femaleCardColor,
                    cardChild: IconContent(
                      gender: 'FEMALE',
                      iconName: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColour: kinactiveCardColor,
                    cardChild: Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT', style: klabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$height',
                              style: klabelNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: klabelTextStyle,
                            )
                          ],
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white60,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0,
                                ),
                                overlayColor: const Color(0x50EB1555),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 20.0,
                                )),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              thumbColor: const Color(0xFFEB1555),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColour: kinactiveCardColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: klabelNumberStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    } else {
                                      print('Negative weights are impossible');
                                    }
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    if (weight < 700) {
                                      weight++;
                                    } else {
                                      print(
                                          'Please check your weight again \nIn case you really weigh more than 700 Kg Go and register for Guinness World Records \nAll The Best! 👍');
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColour: kinactiveCardColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: klabelNumberStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    } else {
                                      print('Age can\'t be negative');
                                    }
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    if (age <= 149) {
                                      age++;
                                    } else {
                                      print(
                                          'humans usually don\'t live this long check your age again');
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain brain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ResultPage(
                        bmiResult: brain.calculateBMI(),
                        resultText: brain.getResult(),
                        interpretation: brain.getInterpretation(),
                      )),
                ),
              );
            },
            child: Container(
              child: const Center(
                  child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(
                top: 5.0,
              ),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  RoundIconButton({this.icon = FontAwesomeIcons.batteryEmpty, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onTap,
      elevation: 6.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(height: 56.0, width: 56.0),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
