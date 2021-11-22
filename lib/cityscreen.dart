import 'package:angela3_i_m_rich/locationScreen.dart';
import 'package:flutter/material.dart';

import 'networkAPI.dart';

const borderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.lightBlue,
    width: 3,
  ),
);
const apiKey = '331533c0cc2197e929ea79cdb2a70e33';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController searchedLocation = TextEditingController();
  String? errorLocation;
  late String cityName;
  void getSearchedLocationData(String cityName) async {
    NetworkHelper getInfo = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var searchedLocationData = await getInfo.getLocationData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data: searchedLocationData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        /*leading: Icon(
          Icons.arrow_back_ios,
        ),*/
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 3,
        ),
        title: Text(
          'Search Location',
        ),
        centerTitle: true,
      ),
      body: Container(
        /*decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/weather.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),*/
        color: Colors.blueAccent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: searchedLocation,
                  cursorColor: Colors.white,
                  cursorHeight: 30,
                  decoration: InputDecoration(
                    errorBorder: borderStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    focusedErrorBorder: borderStyle,
                    disabledBorder: borderStyle,
                    border: borderStyle,
                    errorText: errorLocation,
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    labelText: 'Location',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    hintText: 'Enter city name here',
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontFamily: 'Ubuntu',
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.add_location,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (searchedLocation.text.isEmpty) {
                        errorLocation = 'This field can not be empty';
                      } else if (searchedLocation.text
                          .contains(RegExp(r'[0-9]'))) {
                        errorLocation = 'Invalid Location. Try again.';
                        searchedLocation.clear();
                      } else if (searchedLocation.text.isNotEmpty) {
                        //errorLocation = null;
                        cityName = searchedLocation.text.toLowerCase();
                        getSearchedLocationData(cityName);
                      }
                    });
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  /*style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue),
                  ),*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),*/
