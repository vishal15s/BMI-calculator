import 'package:flutter/material.dart';


class Dispdata extends StatelessWidget {
  Dispdata({
    @required this.dispIcon,
    @required this.iconText,
  });

  final IconData dispIcon;
  final String iconText;
  //const Dispdata({
  //Key key,
  //}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          dispIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(iconText,
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF8D8D8E98),
            ))
      ],
    );
  }
}
