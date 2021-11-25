import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'price_api.dart';

const textStyle = TextStyle(
  fontFamily: 'Ubuntu',
  color: Colors.white,
);

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currencyList.first;

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
        value: selectedCurrency,
        //menuMaxHeight: 200,
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20,
        ),
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Colors.black,
        alignment: Alignment.center,
        items: items,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
          });

          getData(selectedCurrency);
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
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
            ),
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
            selectedCurrency = currencyList[selectedIndex];
          });
        },
      ),
    );
  }

  void getData(String selectedCurrency) async {
    var tempBTC =
        await PriceFromApi(cryptoType: 'BTC', currency: selectedCurrency)
            .getPriceData();
    /*var tempETH =
        await PriceFromApi(cryptoType: 'ETH', currency: selectedCurrency)
            .getPriceData();
    var tempLTC =
        await PriceFromApi(cryptoType: 'LTC', currency: selectedCurrency)
            .getPriceData();*/
    setState(() {
      valueBTC = tempBTC.toString();
      valueETH = tempBTC.toString();
      valueLTC = tempBTC.toString();
    });
  }

  var valueBTC = '?';
  var valueETH = '?';
  var valueLTC = '?';

  /*Widget? getPlatform() {
    if (Platform.isAndroid) {
      return androidDropdown();
    } else if (Platform.isIOS) {
      return iOSPicker();
    }
  }
*/
  @override
  void initState() {
    super.initState();
    getData('AUD');
  }

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
        children: [
          PriceInfo(
            value: valueBTC,
            selectedCurrency: selectedCurrency,
            cryptoType: 'BTC',
          ),
          PriceInfo(
            value: valueETH,
            selectedCurrency: selectedCurrency,
            cryptoType: 'ETH',
          ),
          PriceInfo(
            value: valueLTC,
            selectedCurrency: selectedCurrency,
            cryptoType: 'LTC',
          ),
          SizedBox(
            height: 100,
          ),
          Card(
            margin: EdgeInsets.all(60),
            color: Colors.green,
            child: Platform.isAndroid ? androidDropdown() : iOSPicker(),
          )
        ],
      ),
    );
  }
}

class PriceInfo extends StatelessWidget {
  const PriceInfo({
    Key? key,
    required this.cryptoType,
    required this.value,
    required this.selectedCurrency,
  }) : super(key: key);

  final String value;
  final String selectedCurrency;
  final String cryptoType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            '1 $cryptoType = $value $selectedCurrency',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubutnu',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
