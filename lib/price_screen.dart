import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

const textStyle = TextStyle(
  fontFamily: 'Ubuntu',
  color: Colors.white,
);

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedItems = currencyList.first;

  Center androidDropdown() {
    List<DropdownMenuItem<String>>? items = [];
    for (String currency in currencyList) {
      items.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return Center(
      child: DropdownButton<String>(
        value: selectedItems,
        //menuMaxHeight: 200,
        style: TextStyle(
          fontFamily: 'Ubuntu',
        ),
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Colors.black,
        alignment: Alignment.center,
        items: items,
        onChanged: (value) {
          setState(() {
            selectedItems = value!;
          });
        },
      ),
    );
  }

  Center iOSPicker() {
    List<Padding> items = [];
    for (String currency in currencyList) {
      items.add(
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            currency,
          ),
        ),
      );
    }
    return Center(
      child: CupertinoPicker(
        backgroundColor: Colors.blueAccent,
        children: items,
        itemExtent: 40,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedItems = currencyList[selectedIndex];
          });
        },
      ),
    );
  }

  /*Widget? getPlatform() {
    if (Platform.isAndroid) {
      return androidDropdown();
    } else if (Platform.isIOS) {
      return iOSPicker();
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🪙 Coin Ticker',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            margin: EdgeInsets.all(20),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'sefsf',
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Platform.isAndroid ? androidDropdown() : iOSPicker(),
          ),
        ],
      ),
    );
  }
}
