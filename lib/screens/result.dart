import 'package:flutter/material.dart';
import 'package:cal_bmi/components/constants.dart';
import 'package:cal_bmi/components/cardLayout.dart';
import 'package:cal_bmi/components/ResultButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });


  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Result'),
      ),
       body:
       Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:Text('Your Result',style:kResulthead,textAlign: TextAlign.center,)
            )
            ),
            Expanded(
              flex:5,
              child: CardLayout(
                colorChange: kCardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style:kResultStyle ,
                    ),
                    Text(
                      bmiResult,
                      style: kResultText,
                    ),
                    Text(
                      interpretation,
                      style:kResultSug,
                      textAlign: TextAlign.center,
                    )
                  ],
                  ),
                  )
            ),
             ResultButton(
               displayText: 'RETURN TO HOME',
               onTap:(){
               Navigator.pop(context);
             }
             ),
          ],
       )
    );
  }
}