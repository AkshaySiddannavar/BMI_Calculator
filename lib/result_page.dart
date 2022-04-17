import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult = 'NaN',
      @required this.resultText = 'NaN',
      @required this.interpretation = 'NaN'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 49.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColour: kactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Center(
                  child: Text(
                'RE-CALCULATE',
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
          )
        ],
      ),
    );
  }
}
