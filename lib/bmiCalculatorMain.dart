import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gendercontent.dart';
import 'reusablecard.dart';

const Color color = Color(0xFF1D1E33);

class BMIcalc extends StatefulWidget {
  @override
  _BMIcalcState createState() => _BMIcalcState();
}

class _BMIcalcState extends State<BMIcalc> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: color,
                    cardChild: Center(
                      child: GenderContent(
                        fontAwesomeIcons: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: color,
                    cardChild: GenderContent(
                      fontAwesomeIcons: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: color,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: color,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
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
