import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news/providers/weatherprovider.dart';
import 'package:weather_news/services/weatherservices.dart';

import '../models/weathermodel.dart';

class search extends StatelessWidget {
  String? cityname;
  search({this.updateui});
  VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: const Color(0xFFE80F88),
          title: const Text(
            'Search a city',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 16),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a City Name : '),
          onSubmitted: (data) async {
            cityname = data;
            weatherServices service = weatherServices();
            weatherModel? weather =
                await service.getweather(cityname: cityname!);
            Provider.of<weatherprovider>(context, listen: false).weatherData =
                weather;
            Provider.of<weatherprovider>(context,listen: false).cityname = cityname;
            Navigator.pop(context);
          },
        ),
      )),
    );
  }
}
