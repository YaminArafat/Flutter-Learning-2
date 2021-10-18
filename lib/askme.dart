import 'dart:math';

import 'package:flutter/material.dart';

class AskMe extends StatefulWidget {
  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {
  int ballNum = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ballNum = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$ballNum.png'),
      ),
    );
  }
}
