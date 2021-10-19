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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(2);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              height: 50,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    playAudio(1);
                  });
                },
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(3);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(4);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(5);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(1);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.deepOrange,
              height: 50,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    playAudio(7);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
