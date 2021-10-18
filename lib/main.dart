import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/yaminarafat.jpg'),
            ),
            Text(
              "Yamin Arafat",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CSE KUET',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            )
          ],
        )),
      ),
    );
  }
}
