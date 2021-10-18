import 'package:flutter/cupertino.dart';
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
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                  ),
                  Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'yaminarafat032@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 45),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 45,
                    ),
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '++88 01771-955897',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
