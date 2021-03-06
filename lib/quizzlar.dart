import 'package:angela3_i_m_rich/quizMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Quizzlar extends StatefulWidget {
  @override
  _Quizzlar createState() => _Quizzlar();
}

class _Quizzlar extends State<Quizzlar> {
  double screenSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  QuizMain quizmain = QuizMain();
  List<Icon> scoreKeeper = [];
  /*List<String> questions = [
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
  };*/
  int score = 0;
  void ansHistory(bool givenAns) {
    setState(() {
      if (quizmain.getAns() == givenAns) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        score++;
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (quizmain.isFinished()) {
        Alert(
            context: context,
            title: 'Finished',
            desc: 'No more questions left!',
            closeFunction: () {
              Navigator.pop(context);
              setState(() {
                scoreKeeper.clear();
                score = 0;
                quizmain.setQuesNo();
              });
            },
            buttons: [
              DialogButton(
                  color: Colors.red,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      scoreKeeper.clear();
                      score = 0;
                      quizmain.setQuesNo();
                    });
                  }),
              DialogButton(
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      scoreKeeper.clear();
                      score = 0;
                      quizmain.setQuesNo();
                    });
                  })
            ]).show();
      } else {
        quizmain.nextQues();
      }
    });
  }

  String? quesError, ansError;
  TextEditingController quesController = TextEditingController();
  TextEditingController ansController = TextEditingController();
  var ansFormKey = GlobalKey<FormState>();
  PanelController panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    scoreKeeper.clear();
                    score = 0;
                    if (panelController.isPanelOpen) {
                      panelController.close();
                      quesController.clear();
                      ansController.clear();
                    } else {
                      quesController.clear();
                      ansController.clear();
                    }
                  });
                },
                child: Text(
                  'RESET',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              ),
              Center(
                child: Text(
                  score.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Center(
                child: Text(
                  quizmain.getQues(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton.extended(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                if (panelController.isPanelOpen) {
                  panelController.close();
                } else
                  panelController.open();
              });
            },
            label: const Text(''),
            tooltip: 'Add Q',
            isExtended: false,
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
                ansHistory(true);
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
                ansHistory(false);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ),
          SlidingUpPanel(
            //backdropEnabled: true,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 15),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            controller: panelController,
            minHeight: 40,
            maxHeight: 200,
            collapsed: Column(
              children: [
                Center(
                  child: Icon(Icons.arrow_circle_up, color: Colors.black),
                ),
                Center(
                  child: Text(
                    'Slide up to add more questions',
                    style: TextStyle(
                      color: Colors.white70,
                      //fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            //padding: EdgeInsets.all(10),
            //backdropEnabled: true,
            panel: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      maxLength: 500,
                      maxLines: 10,
                      minLines: 1,
                      controller: quesController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.question_answer,
                          color: Colors.black,
                        ),
                        labelText: 'Question',
                        errorText: quesError,
                        errorStyle: TextStyle(fontFamily: 'Ubuntu'),
                        hintText: 'Enter Questions Here',
                        hintStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                    TextFormField(
                      maxLength: 5,
                      maxLines: 1,
                      minLines: 1,
                      // key: ansFormKey,
                      controller: ansController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.black,
                        ),
                        errorText: ansError,
                        errorStyle: TextStyle(fontFamily: 'Ubuntu'),
                        labelText: 'Answer',
                        hintText: 'Enter Answer Here',
                        hintStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black, fontFamily: 'Ubuntu'),
                      ),
                      /*validator: (String? value) {
                        return ((value != null && value != 'true') ||
                                (value != null && value != 'false') ||
                                (value == null))
                            ? 'Invalid'
                            : value;
                      },*/
                      textCapitalization: TextCapitalization.none,
                      /*onSaved: (String? value) {
                        print('value $value');
                      },*/
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (quesController.text.isEmpty) {
                          setState(() {
                            quesError = 'Question can not be empty!';
                          });
                        } else {
                          setState(() {
                            quesError = null;
                          });
                        }
                        if (ansController.text.isNotEmpty &&
                            (ansController.text == 'true' ||
                                ansController.text == 'false')) {
                          setState(() {
                            ansError = null;
                          });
                        } else {
                          setState(() {
                            ansError = 'Invalid answer!';
                          });
                        }
                        if (quesError == null && ansError == null) {
                          setState(() {
                            quizmain.addQues(
                                q: quesController.text, a: ansController.text);
                            quesController.clear();
                            ansController.clear();
                          });
                        }
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
