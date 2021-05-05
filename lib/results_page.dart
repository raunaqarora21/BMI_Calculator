import 'BottomButton.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult,this.text,this.interpretation});
  final String bmiResult;
  final String text;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: kTitleButton,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,

              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text(text,style: kResultText,),
                  Text(bmiResult,style: kBMIResultText,),
                  Text(interpretation,style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                  BottomButton(
                  onTap: (){
                    Navigator.pop(context);
                  },title : 'RE-CALCULATE',)

                ],
              ),
            ),
          )

        ],
      )
    );
  }
}
