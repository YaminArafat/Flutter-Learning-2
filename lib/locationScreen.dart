import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final String data;
  LocationScreen({required this.data});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late double lat;
  late double lon;
  late String location;
  late int pressure;
  late int humidity;
  late double windSpeed;
  late String description;
  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  void updateUI(dynamic data) {
    temp = jsonDecode(data)['main']['temp'] - 273;
    lat = jsonDecode(data)['coord']['lat'];
    lon = jsonDecode(data)['coord']['lon'];
    location = jsonDecode(data)['name'];
    pressure = jsonDecode(data)['main']['pressure'];
    humidity = jsonDecode(data)['main']['humidity'];
    windSpeed = jsonDecode(data)['wind']['speed'];
    description = jsonDecode(data)['weather'][0]['description'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather5.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Latitude: ' + lat.toStringAsFixed(5),
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Longitude: ' + lon.toStringAsFixed(5),
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    temp.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 130,
                    ),
                  ),
                  Text(
                    'emo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    description.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Humidity: ' + humidity.toString(),
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pressure: ' + pressure.toString(),
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Wind Speed: ' + windSpeed.toString(),
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
