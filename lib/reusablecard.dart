import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  /*const ReusableCard({
    Key? key,
  }) : super(key: key);*/

  final Color color;
  final Widget? cardChild;

  ReusableCard({required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      /*height: height / 3 - 40,
      width: .5 * width - 30,*/
    );
  }
}
