import 'package:geolocator/geolocator.dart';

import 'location.dart';
import 'networkAPI.dart';

const apiKey = '331533c0cc2197e929ea79cdb2a70e33';
const weatherLink = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherDetails {
  Future<dynamic> getSearchedLocationData(String cityName) async {
    NetworkHelper getInfo =
        NetworkHelper('$weatherLink?q=$cityName&appid=$apiKey&units=metric');
    var searchedLocationData = await getInfo.getLocationData();
    return searchedLocationData;
  }

  Future<dynamic> getCurrentLocationData() async {
    try {
      Location location = Location();
      Position position = await location.getLocation();
      NetworkHelper networkHelper = NetworkHelper(
          '$weatherLink?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');
      var locationData = await networkHelper.getLocationData();
      return locationData;
    } catch (e) {
      return e;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '⛈';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition >= 500 && condition <= 504) {
      return '🌦';
    } else if (condition < 600) {
      return '🌧️';
    } else if (condition < 700) {
      return '❄';
    } else if (condition == 800) {
      return '☀';
    } else if (condition < 800) {
      return '🌪';
    } else if (condition < 900) {
      return '🌤';
    }
    return '';
  }

  String getMessage(int temp) {
    if (temp >= 30) {
      return 'Very hot day. You should get a 🍦';
    } else if (temp >= 25) {
      return 'It\'s a warm day. Cold 🚿 is a good idea';
    } else if (temp >= 20) {
      return 'Quiet cold. A cup of 🫖 will keep you warm';
    } else if (temp >= 15) {
      return 'It\'s very cold 🌞. Why not drink ☕';
    } else if (temp < 15) {
      return 'It\'s freezing cold 🥶. Don\'t forget to bring 🧥';
    }
    return '';
  }
}
// 🌩️ 🌩 🌧️ 🌨️ 🌨 🌦 🌤️ 🌤 ⛈ 🌤️ 🌤 ☁️☁ 🌫️ 🌫 🌁   👕 🩳 🛀 🛁 🚿 🏊‍♂️☃️💧 🥶 🧥 ☕ 🌞 🫖
