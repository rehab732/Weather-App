import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news/pages/search.dart';
import 'package:weather_news/providers/weatherprovider.dart';

import '../models/weathermodel.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // void updateui(){
  //   setState((){

  //   });
  // }
weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<weatherprovider>(context).weatherData;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         // backgroundColor: const Color(0xFFE80F88),
          title: const Text(
            'Weather App',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return search(
                      //updateui: updateui,
                    );
                  }
                  ));
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
              iconSize: 25,
            ),
          ]),
      body: weatherData ==null
       ? Center(
          child: Column(
        children: const [
          SizedBox(
            height: 180,
          ),
          Text(
            "Weather",
            style: TextStyle(
                color: Color(0xFFE80F88),
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
         Text(
            "Local Weather Around The World",
            style: TextStyle(
              color: Color(0xFFE80F88),
              fontSize: 20,
            ),
          ),
         Image(image: AssetImage('assets/images/download.png')),
        ],
      )): Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            weatherData!.gettheme(),
            weatherData!.gettheme()[300]!,
            weatherData!.gettheme()[100]!,

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
        ),
        //color: weatherData!.gettheme(),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
           Text(Provider.of<weatherprovider>(context).cityname ?? 'Alexx',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF533483),

          ),),
          Text(weatherData?.date?? ''),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              Image(image: AssetImage(weatherData?.getImage()??'assets/images/clear.png')),
            const  SizedBox(width: 40,),
               Text(weatherData!.temp.toInt().toString(),style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF533483),
              ),),
             const SizedBox(width: 60,),

              Column(children:  [
                Text('Max temp : ${weatherData!.maxtemp.toInt()}',style:const TextStyle(color: Color(0xFF533483)),),
              Text('Min temp : ${weatherData!.mintemp.toInt()}',style: const TextStyle(color: Color(0xFF533483)),),
              ],)


            ],
          ),
         const SizedBox(height: 30,),
           Text(
            weatherData?.weatherstate ?? '', 
            style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF533483),

          ),),
          


        ]),
      ),
    );
  }
}
