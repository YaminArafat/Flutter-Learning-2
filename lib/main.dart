import 'package:angela3_i_m_rich/bmiCalculatorMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1E1531),
        scaffoldBackgroundColor: Color(0xFF1E1531),
      ),
      /*home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Flutter Learning'),
          centerTitle: true,
        ),
        body: Destiny(),
        ),*/
      home: BMIcalc(),
    );
  }
}
