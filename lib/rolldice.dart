import 'dart:math';

import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  @override
  DicePageState createState() => DicePageState();
}

class DicePageState extends State<RollDice> {
  int leftDiceNumber = 1, rightDiceNumber = 1, diceNumber = 1;
  void changeDicePhase() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDicePhase();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDicePhase();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}
