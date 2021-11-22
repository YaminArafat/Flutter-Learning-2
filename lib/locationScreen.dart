import 'dart:convert';

import 'package:angela3_i_m_rich/loadingScreen.dart';
import 'package:angela3_i_m_rich/weatherDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cityscreen.dart';

class LocationScreen extends StatefulWidget {
  final String data;
  LocationScreen({required this.data});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late double lat;
  late double lon;
  late String location;
  late int pressure;
  late int humidity;
  late double windSpeed;
  late String description;
  late String main;
  late int feelsLike;
  late int visibility;
  late int condition;
  WeatherDetails weatherDetails = WeatherDetails();
  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  void updateUI(dynamic data) {
    double t = jsonDecode(data)['main']['temp'];
    temp = t.toInt();
    lat = jsonDecode(data)['coord']['lat'];
    lon = jsonDecode(data)['coord']['lon'];
    location = jsonDecode(data)['name'];
    pressure = jsonDecode(data)['main']['pressure'];
    humidity = jsonDecode(data)['main']['humidity'];
    windSpeed = jsonDecode(data)['wind']['speed'];
    description = jsonDecode(data)['weather'][0]['description'];
    main = jsonDecode(data)['weather'][0]['main'];
    t = jsonDecode(data)['main']['feels_like'];
    feelsLike = t.toInt();
    visibility = jsonDecode(data)['visibility'];
    condition = jsonDecode(data)['weather'][0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather5.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),*/
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoadingScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              /*SizedBox(
                height: 50,
              ),*/
              Column(
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        width: 20,
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
                ],
              ),
              /*SizedBox(
                height: 50,
              ),*/
              Column(
                children: [
                  Text(
                    temp.toString() + '°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 130,
                    ),
                  ),
                  Text(
                    'Feels Like ' + feelsLike.toString() + '°C',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    weatherDetails.getWeatherIcon(condition),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        main + ',',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Humidity: ' + humidity.toString() + ' %',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  /*SizedBox(
                    height: 10,
                  ),*/
                  Text(
                    'Pressure: ' + pressure.toString() + ' Pa',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  /*SizedBox(
                    height: 10,
                  ),*/
                  Text(
                    'Wind Speed: ' + windSpeed.toString() + ' Km/h',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  /*SizedBox(
                    height: 10,
                  ),*/
                  Text(
                    'Visibility: ' + visibility.toString() + ' Km',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Text(
                weatherDetails.getMessage(temp),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
