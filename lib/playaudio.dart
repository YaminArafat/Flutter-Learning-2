import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayAudio extends StatefulWidget {
  @override
  _PlayAudioState createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  final player = AudioCache();

  void playAudio(int noteNum) {
    player.play('note$noteNum.wav');
  }

  //Widget
  Expanded buildFunc(
      {Color color = Colors.red,
      int noteNum = 1,
      Color buttonColor = Colors.white}) {
    return Expanded(
      child: Container(
        color: color,
        height: 50,
        child: TextButton(
          child: Center(
            child: Text(
              'Click Me',
              style: TextStyle(
                color: buttonColor,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              playAudio(noteNum);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildFunc(color: Colors.blue, noteNum: 1, buttonColor: Colors.white),
          buildFunc(color: Colors.red, noteNum: 2, buttonColor: Colors.amber),
          buildFunc(
              color: Colors.yellow, noteNum: 3, buttonColor: Colors.green),
          buildFunc(color: Colors.green, noteNum: 4, buttonColor: Colors.brown),
          buildFunc(
              color: Colors.purple, noteNum: 5, buttonColor: Colors.white),
          buildFunc(color: Colors.brown, noteNum: 1, buttonColor: Colors.white),
          buildFunc(color: Colors.orange, noteNum: 7, buttonColor: Colors.red),
        ],
      ),
    );
  }
}
