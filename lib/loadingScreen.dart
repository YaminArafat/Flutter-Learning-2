import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=331533c0cc2197e929ea79cdb2a70e33'));
    String data = response.body;
    var temp = jsonDecode(data)['main']['temp'];
    var id = jsonDecode(data)['weather'][0]['id'];
    var city = jsonDecode(data)['name'];
    print(temp);
    print(id);
    print(city);
  }

  /*late double lat;
  late double long;*/
  //Location location = Location();
  void getCurrentLocation() async {
    //await location.getLocation();
    print('objryhredhdect');
    try {
      var position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            ElevatedButton(
              onPressed: () {
                //getLocation();
                setState(() {
                  print('object');
                  getCurrentLocation();
                  print('gjdthdr');
                });
              },
              child: Text('Get Loaction'),
            ),
            Text(
              //location.latitude.toString(),
              '',
            ),
            Text(
              //location.longitude.toString(),
              '',
            ),
          ]),
        ),
      ),
    );
  }
}
