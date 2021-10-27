import 'package:angela3_i_m_rich/storymain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Destiny extends StatefulWidget {
  @override
  _DestinyState createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {
  StoryMain storyMain = StoryMain();
  void validate() {
    setState(() {
      if (storyMain.isOver()) {
        Alert(
            context: context,
            title: 'Game Over',
            desc: 'End of the story',
            closeFunction: () {
              Navigator.pop(context);
              setState(() {
                storyMain.setStory();
              });
            },
            buttons: [
              DialogButton(
                  color: Colors.green,
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      storyMain.setStory();
                    });
                  })
            ]).show();
      } else {
        storyMain.nextStory();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                storyMain.getStory(),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            color: Colors.blue,
            child: TextButton(
              child: Text(
                storyMain.getStoryOp1(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                validate();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              bottom: 30,
              top: 20,
              left: 20,
              right: 20,
            ),
            color: Colors.purple,
            child: TextButton(
              onPressed: () {
                validate();
              },
              child: Text(
                storyMain.getStoryOp2(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
