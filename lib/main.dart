import 'package:angela3_i_m_rich/quizzlar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Flutter Learning'),
          centerTitle: true,
        ),
        body: Quizzlar(),
      ),
    );
  }
}
