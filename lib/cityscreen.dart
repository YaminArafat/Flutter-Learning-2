import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/weather.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),*/
        color: Colors.blueAccent,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                  Icons.add_location,
                  color: Colors.white,
                )),
              ),
              Container(
                color: Colors.white,
                child: Text(
                  'sdfsdf',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
