import 'package:flutter/cupertino.dart';
import 'package:weather_news/models/weathermodel.dart';

class weatherprovider extends ChangeNotifier{

  weatherModel? _weatherData;
  String? cityname;
  set weatherData(weatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }
  weatherModel? get weatherData=> _weatherData;
}