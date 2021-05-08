import 'package:flutter/material.dart';
import 'package:cal_bmi/screens/input_page.dart';
void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E30),
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}

