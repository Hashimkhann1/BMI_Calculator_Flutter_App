import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //font_awesome_Icon
import '../components/icon_content.dart'; // file
import '../components/reusable_card.dart'; //file
import '../constant.dart'; //file
import '../components/round_icon_button.dart'; //file
import '../screen/result_page.dart'; //file
import '../components/buttom_buttom.dart';
import 'package:bmi_calculator/calculator-brain.dart';



const appBarText = Text('BMI CALCULATOR');

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 140;
  int weight = 60;
  int age = 18;

  dynamic maleCardColor = KInactiveCardColor;
  dynamic femaleCardcolor = KInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    onTap: () => {
                      setState(() {
                        selectedGender = Gender.male;
                      }),
                    },
                    colour: selectedGender == Gender.male ? kAtiveCardColour : KInactiveCardColor,
                    cardChild: iconContent(FontAwesomeIcons.mars, 'MALE',),
                  ),
              ),
              Expanded(
                  child: ReusableCard(
                    onTap: () => {
                      setState(() {
                        selectedGender = Gender.female;
                      }),
                    },
                      colour: selectedGender == Gender.female ? kAtiveCardColour : KInactiveCardColor,
                    cardChild: iconContent(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
                colour: kAtiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                    style: KLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: KNumberStyle,
                        ),
                        Text('cm',
                        style: KLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor:Color(0xFF8d8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x48EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 210.0,
                        // activeColor: Colors.white,
                        onChanged: (double newValue){
                         setState(() {
                           height = newValue.round();
                         });
                        },
                      ),
                    ),
                  ],
                ),
            )
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: kAtiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'Wight',
                          style: KLabelTextStyle,
                      ),
                      Text(
                          weight.toString(),
                        style: KNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconbutton(
                            icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              }
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          RoundIconbutton(
                            icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              }
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ),
              Expanded(
                  child: ReusableCard(
                      colour: kAtiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconbutton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                }
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundIconbutton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              )
            ],
          )),
          ButtomButton(
            buttomTitle: 'CALCULATE',
            onTap:  (){
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResutsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),);
            },
          )
        ],
      )
    );
  }
}