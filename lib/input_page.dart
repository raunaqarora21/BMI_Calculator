import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'RoundActionButton.dart';
import 'results_page.dart';
import 'package:bmi_calculator/BottomButton.dart';
import 'calculator_brain.dart';
enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 19;

  void updateColor(Gender gender){
    if(gender == Gender.male){
      if(maleCardColor == kActiveCardColor){
        maleCardColor = kInactiveCardColor;
        femaleCardColor = kActiveCardColor;
      }else{
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      }
    }
    else{
      if(femaleCardColor == kActiveCardColor){
        femaleCardColor = kInactiveCardColor;
        maleCardColor = kActiveCardColor;
      }
      else{
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(children: [
              Expanded(

                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                      colour: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        data: 'MALE',
                      ))),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                      setState(() {
                      updateColor(Gender.female);
                      });
                  },

                    colour: femaleCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, data: 'FEMALE')),
              ),
            ])),
            Expanded(
              child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('HEIGHT',style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),
                      child: Slider(value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.toInt();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: kLabelTextStyle,),

                          Text(weight.toString(),
                          style: kNumberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                                RoundActionButton(icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    weight--;
                                  });
                                },),
                              SizedBox(width: 10.0,),
                              RoundActionButton(icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },)
                            ],
                          )
                        ],
                      ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: kLabelTextStyle,),

                          Text(age.toString(),
                            style: kNumberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              RoundActionButton(
                                icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                              ),
                              SizedBox(width: 10.0,),
                              RoundActionButton(icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },)
                            ],
                          )
                        ],
                      ),
                ))
              ],
            )),
            BottomButton(onTap: (){
              CalculatorBrain cal = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: cal.calculateBMI(),
                text: cal.getResult(),
                interpretation: cal.getInterpretation(),
              )));
            }
              ,title:'CALCULATE',)
          ],
        ));
  }
}

