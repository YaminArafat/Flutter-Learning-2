import 'package:angela3_i_m_rich/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  }

  /*late double lat;
  late double long;*/
  //Location location = Location();
  void getCurrentLocation() async {
    //await location.getLocation();
    print('objryhredhdect');
    Position position = await Geolocator.getCurrentPosition();
    print(position);
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
