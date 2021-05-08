import 'package:flutter/material.dart';
import 'package:cal_bmi/components/constants.dart';



class ResultButton extends StatelessWidget {
  ResultButton({
    @required this.displayText,
    @required this.onTap,
  });

  final String displayText;
  final Function onTap;
  //const ResultButton({
   // Key key,
  //}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(displayText,style: kButtonText,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom:10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}