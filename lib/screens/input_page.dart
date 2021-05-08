import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cal_bmi/components/icon_content.dart';
import 'package:cal_bmi/components/cardLayout.dart';
import 'package:cal_bmi/components/constants.dart';
import 'package:cal_bmi/screens/result.dart';
import 'package:cal_bmi/components/ResultButton.dart';
import 'package:cal_bmi/calcfunction.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  


  Gender selected;
  int height = 180;
  int weight = 60;
  int age = 19;
  // Color maleCardColor = activeCardcolor;
  // Color femaleCardColor = activeCardcolor;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == cardcolor) {
  //       maleCardColor = activeCardcolor;
  //       femaleCardColor = cardcolor;
  //     } else {
  //       maleCardColor = cardcolor;
  //     }
  //   }
  //   if (gender ==Gender.female) {
  //     if (femaleCardColor == cardcolor) {
  //       femaleCardColor = activeCardcolor;
  //       maleCardColor = cardcolor;
  //     } else {
  //       femaleCardColor = cardcolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: CardLayout(
                    onpress: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    colorChange:
                        selected == Gender.male ? kActiveCardcolor : kCardcolor,
                    cardChild: Dispdata(
                        dispIcon: FontAwesomeIcons.mars, iconText: 'MALE')),
              ),
              Expanded(
                child: CardLayout(
                    onpress: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    colorChange: selected == Gender.female
                        ? kActiveCardcolor
                        : kCardcolor,
                    cardChild: Dispdata(
                        dispIcon: FontAwesomeIcons.venus, iconText: 'FEMALE')),
              ),
            ],
          )),
          Expanded(
            child: CardLayout(
              colorChange: kCardcolor,
              cardChild: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Height',
                    style: kSlidheadtextStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kHeighttextStyle),
                      Text(
                        'cm',
                        style: kCmTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: CardLayout(
                    colorChange: kCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kSlidheadtextStyle),
                        Text(
                          weight.toString(),
                          style: kHeighttextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  iconDisplay: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  iconDisplay: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                            ]),
                      ],
                    )),
              ),
              Expanded(
                child: CardLayout(
                    colorChange: kCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kSlidheadtextStyle),
                        Text(
                          age.toString(),
                          style: kHeighttextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  iconDisplay: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  iconDisplay: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ]),
                      ],
                    )),
              )
            ],
          )),
          ResultButton(displayText: 'CALCULATE',
          onTap:(){
            Calculator calc = Calculator(height:height,weight:weight);

              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ResultPage(
                bmiResult:calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
           ),
         );
      },
          ),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconDisplay, @required this.press});
  final IconData iconDisplay;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconDisplay),
      elevation: 0.0,
      onPressed: press,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
