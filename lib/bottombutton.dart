import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  BottomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: bottomContainerColor,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
