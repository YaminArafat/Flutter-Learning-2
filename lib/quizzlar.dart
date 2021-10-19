import 'dart:math';

import 'package:flutter/material.dart';

class Quizzlar extends StatefulWidget {
  @override
  _Quizzlar createState() => _Quizzlar();
}

class _Quizzlar extends State<Quizzlar> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Dhaka is the capital of Bangladesh',
    'Rajshahi is the capital of Bangladesh',
    'Friday comes after Thursday',
    'Staurday comes after Sunday',
  ];
  Map<String, bool> quesAns = {
    'Dhaka is the capital of Bangladesh': true,
    'Rajshahi is the capital of Bangladesh': false,
    'Friday comes after Thursday': true,
    'Staurday comes after Sunday': false,
  };
  int quesNo = Random().nextInt(4);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Center(
                child: Text(
                  questions[quesNo],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            color: Colors.green,
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Oswald',
                  letterSpacing: 5,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quesAns[questions[quesNo]] == true) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  }
                  if (quesAns[questions[quesNo]] == false) {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  quesNo = Random().nextInt(4);
                });
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            color: Colors.red,
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Oswald',
                  letterSpacing: 5,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quesAns[questions[quesNo]] == true) {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (quesAns[questions[quesNo]] == false) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  }
                  quesNo = Random().nextInt(4);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }
}
