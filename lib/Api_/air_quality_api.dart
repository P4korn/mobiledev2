import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev2/model/air_quality_data.dart';
import 'dart:convert';

class AirQualityApi {
  static const String apiUrl = 'https://api.waqi.info/feed';
  static const String apiKey = 'c81f55a8c8d964a5794aef7b003a037fbd8c8d9a';

  static Future<AirqualityData> getAirQualityData(String city) async {
    final response = await http.get(Uri.parse('$apiUrl/$city/?token=$apiKey'));

    if (response.statusCode == 200) {
      print(response.body);
      return AirqualityData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get air quality data');
    }
  }
}
