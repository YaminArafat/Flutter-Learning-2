import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'gendercontent.dart';
import 'reusablecard.dart';

class BMIcalc extends StatefulWidget {
  @override
  _BMIcalcState createState() => _BMIcalcState();
}

enum GenderType {
  MALE,
  FEMALE,
}
enum CardType {
  Weight,
  Age,
}

class _BMIcalcState extends State<BMIcalc> {
  GenderType? selectedGender;
  int height = 100;
  int weight = 15;
  int age = 10;
  /*Color maleCardColor = deactiveColor;
  Color femaleCardColor = deactiveColor;
  void setTapColor(GenderType genderType) {
    setState(() {
      // genderType == GenderType.MALE ? maleCardColor = activeColor;femaleCardColor = deactiveColor;:femaleCardColor = activeColor;maleCardColor=deactiveColor;
      if (genderType == GenderType.MALE) {
        if (maleCardColor == deactiveColor) {
          maleCardColor = activeColor;
          if (femaleCardColor == activeColor) {
            femaleCardColor = deactiveColor;
          }
        } else
          maleCardColor = deactiveColor;
      } else {
        if (femaleCardColor == deactiveColor) {
          femaleCardColor = activeColor;
          if (maleCardColor == activeColor) {
            maleCardColor = deactiveColor;
          }
        } else {
          femaleCardColor = deactiveColor;
        }
      }
    });
  }*/
  Column weightAgeCard(String text, CardType cardType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: labelTextStyle,
        ),
        Text(
          cardType == CardType.Weight ? weight.toString() : age.toString(),
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: deactiveColor,
              onPressed: () {
                setState(() {
                  cardType == CardType.Weight ? weight-- : age--;
                });
              },
              child: Icon(
                //Icons.remove,
                FontAwesomeIcons.minus,
                size: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              backgroundColor: deactiveColor,
              onPressed: () {
                setState(() {
                  cardType == CardType.Weight ? weight++ : age++;
                });
              },
              child: Icon(
                //Icons.add,
                FontAwesomeIcons.plus,
                size: 20,
                color: Colors.white,
              ),
              /*Text(
                '+',
                style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),*/
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (selectedGender == GenderType.MALE)
                          selectedGender = null;
                        else
                          selectedGender = GenderType.MALE;
                      });
                    },
                    color: selectedGender == GenderType.MALE
                        ? activeColor
                        : deactiveColor,
                    cardChild: Center(
                      child: GenderContent(
                        fontAwesomeIcons: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (selectedGender == GenderType.FEMALE)
                          selectedGender = null;
                        else
                          selectedGender = GenderType.FEMALE;
                      });
                    },
                    color: selectedGender == GenderType.FEMALE
                        ? activeColor
                        : deactiveColor,
                    cardChild: GenderContent(
                      fontAwesomeIcons: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 200,
                    activeColor: bottomContainerColor,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: weightAgeCard('Weight', CardType.Weight),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: weightAgeCard('Age', CardType.Age),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: 60,
          )
        ],
      ),
      /*floatingActionButton: Theme(
        data: ThemeData(
          accentColor: Colors.purple,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),*/
    );
  }
}
