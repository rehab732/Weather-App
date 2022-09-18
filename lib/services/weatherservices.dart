import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_news/models/weathermodel.dart';

// ignore: camel_case_types
class weatherServices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '896f6d7a0b1649a596244528221409';
  Future<weatherModel?> getweather({required String cityname}) async {
    weatherModel? model;
    try{
         Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&days=7');
    // ignore: unused_local_variable
    http.Response response = await http.get(url);

    Map<String, dynamic> currentdata = jsonDecode(response.body);
    var jsondata = currentdata['forecast']['forecastday'][0]['day'];

    model=weatherModel.fromJson(currentdata);

    }catch(e)
    {
      print('error');

    }
 
    return model;
  }
}
