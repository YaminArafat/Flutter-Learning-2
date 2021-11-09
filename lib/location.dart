import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude = 0;
  late double longitude = 0;
  Future<void> getLocation() async {
    /*bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }*/
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      print(position);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      print(position.latitude);
    } catch (e) {
      print(e);
    }
  }
}
