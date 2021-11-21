import 'package:angela3_i_m_rich/location.dart';
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
    try {
      Location location = Location();
      Position position = await location.getLocation();
      NetworkHelper networkHelper = NetworkHelper(
          'http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');
      var locationData = await networkHelper.getLocationData();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          data: locationData,
        );
      }));
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
