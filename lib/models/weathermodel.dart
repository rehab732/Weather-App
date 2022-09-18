import 'dart:ui';

import 'package:flutter/material.dart';

class weatherModel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstate;
  weatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstate});
  factory weatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return weatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherstate: jsonData['condition']['text']);
  }
  String? getImage() {
    if (weatherstate == 'Clear' || weatherstate == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherstate == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy Rain' ||
        weatherstate == 'Showers ') {
      return'assets/images/rainy.png';
    } else if (weatherstate == 'Thunderstorm'|| weatherstate=='Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

MaterialColor gettheme() {
    if (weatherstate == 'Clear' || weatherstate == 'Light Cloud') {
      return  Colors.red;
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return  Colors.blueGrey;
    } else if (weatherstate == 'Heavy Cloud') {
      return  Colors.lime;
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy Rain' ||
        weatherstate == 'Showers ') {
      return  Colors.lightBlue;
    } else if (weatherstate == 'Thunderstorm'|| weatherstate=='Thunder') {
      return  Colors.brown;
    } else {
      return  Colors.indigo;
    }
  }
}
