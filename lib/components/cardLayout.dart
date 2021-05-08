import 'package:flutter/material.dart';


class CardLayout extends StatelessWidget {
  CardLayout({
    @required this.colorChange,
    this.cardChild,
    this.onpress,
  });
  final Color colorChange;
  final Widget cardChild;
  final Function onpress;

  //const CardLayout({
  // Key key,
  //}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onpress,
        child: Container(
        child: cardChild,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: colorChange,
        borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
