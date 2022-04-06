import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class TranlatorsProviders with ChangeNotifier {
  String urlmaster = "https://api.cognitive.microsofttranslator.com";
  var uuid = const Uuid();
  var responData;
  Future<void> translate(String text) async {
    String params = "api-version=3.0&from=en&to=id";

    Uri uri = Uri.parse('$urlmaster/translate?api-version=3.0&from=en&to=id');

    var body = "[{'text': '$text'}]";
    try {
      final response = await http.post(uri, body: body, headers: {
        'Ocp-Apim-Subscription-Key': 'd0fa62fef03744a69b807f2c103d9fd3',
        'Ocp-Apim-Subscription-Region': 'eastus',
        'Content-type': 'application/json',
        'X-ClientTraceId': uuid.v4().toString()
      });

      throw responData = json.decode(response.body);
    } catch (data) {
      throw (data);
    }
  }
}
