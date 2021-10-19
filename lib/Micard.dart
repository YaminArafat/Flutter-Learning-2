import 'package:flutter/material.dart';

class MiCard extends StatefulWidget {
  @override
  _MiCard createState() => _MiCard();
}

class _MiCard extends State<MiCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          SizedBox(
            height: 10,
            width: 150,
            child: Divider(
              height: 20,
              color: Colors.amber,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text(
                'yaminarafat032@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.green,
              ),
              title: Text(
                '++88 01771-955897',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
