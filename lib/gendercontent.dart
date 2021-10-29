import 'package:flutter/material.dart';

class GenderContent extends StatelessWidget {
  final IconData fontAwesomeIcons;
  final String label;

  GenderContent({required this.fontAwesomeIcons, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontAwesomeIcons,
          size: 90,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
