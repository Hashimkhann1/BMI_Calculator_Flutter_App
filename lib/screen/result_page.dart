import 'package:flutter/material.dart';
import '../constant.dart'; //file
import '../components/reusable_card.dart'; //file
import '../components/buttom_buttom.dart'; //file
import 'input_page.dart'; //file

class ResutsPage extends StatelessWidget {

  ResutsPage({@required this.bmiResult ,@required this.resultText , @required this.interpretation});

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCUATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kResultTextStyle,
                )
            ),
          ),
          Expanded(
            flex: 5,
              child : ReusableCard(colour: kAtiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toString().toUpperCase(),
                    style: kCalculateTextStyle,
                  ),
                  Text(bmiResult.toString(),
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation.toString(),
                    textAlign: TextAlign.center,
                    style: kcalculatorBodyTextStyle,
                  )
                ],
              ),
              ),
          ),
          ButtomButton(
            buttomTitle: 'RE_CALCULATE',
            onTap:  (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
