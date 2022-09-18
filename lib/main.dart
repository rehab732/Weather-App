import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news/pages/login.dart';
import 'package:weather_news/providers/weatherprovider.dart';



void main() {
  runApp( ChangeNotifierProvider(create: (BuildContext context) {  return weatherprovider(); },
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Weather News',
        theme: ThemeData(
          primarySwatch: Provider.of<weatherprovider>(context).weatherData==null ? Colors.brown : Provider.of<weatherprovider>(context).weatherData!.gettheme(),
          scaffoldBackgroundColor:const Color(0xFFE5E5E5),
         
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.subtitle1,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFE80F88))
              ),
              disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFE80F88))
              ),
              enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(color: Color(0xFFE80F88))
              
              ),
              errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(color: Colors.red)
              
              ),
              focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(color: Colors.red)
              
              ),
          ),
        ),
      home:login(),
    );
  }
}



