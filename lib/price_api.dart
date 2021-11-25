import 'dart:convert';

import 'package:http/http.dart' as http;

const urlLink = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class PriceFromApi {
  final String cryptoType;
  final String currency;
  PriceFromApi({required this.cryptoType, required this.currency});
  Future<double> getPriceData() async {
    http.Response response =
        await http.get(Uri.parse('https://blockchain.info/ticker'));
    String priceData = response.body;
    return jsonDecode(priceData)['$currency']['buy'];
  }
}
// 9504bb93-9420-4dec-9bbc-5501969f089b
// https://blockchain.info/ticker
