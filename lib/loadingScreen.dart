import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'locationScreen.dart';
import 'networkAPI.dart';

const apiKey = '331533c0cc2197e929ea79cdb2a70e33';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  void getCurrentLocationData() async {
    print('objryhredhdect');
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
      NetworkHelper networkHelper = NetworkHelper(
          'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
      var locationData = await networkHelper.getLocationData();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          data: locationData,
        );
      }));
      var temp = jsonDecode(locationData)['main']['temp'];
      var id = jsonDecode(locationData)['weather'][0]['id'];
      var city = jsonDecode(locationData)['name'];
      print(temp);
      print(id);
      print(city);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        )),
      ),
    );
  }
}

/*

Column(children: [
            ElevatedButton(
              onPressed: () {
                getCurrentLocationData();
                /*setState(() {
                  print('object');
                  getCurrentLocation();
                  print('gjdthdr');
                });*/
              },
              child: Text('Get Loaction'),
            ),
          ]),
 */
