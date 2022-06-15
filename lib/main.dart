import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchScreen.dart';
import 'package:weather/weather.dart';
import 'dart:async';

void main()
{
  runApp(my_app());
}

class my_app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: app(),
    );
  }
}

class app extends StatefulWidget {

  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {

  var cityName = "izmir";
  int temp;
  String image_path = "";
  String weather_icon = "";
  String description = "";
  String background_path = "images/waterfall.jpg";
  Color text_color = Colors.white;
  
  WeatherFactory wf = new WeatherFactory("195dadb87a112a791ce332cc4ecc3fae");

   forecastInitial() async
  {
    Weather w = await wf.currentWeatherByCityName(cityName);
    setState(() {
      temp = w.temperature.celsius.round();
      weather_icon = w.weatherIcon;
      print(weather_icon);
      weatherIconController(weather_icon);
      description = w.weatherDescription;
    });
  }

  getYourForecast() async
  {
    Weather w = await wf.currentWeatherByCityName("izmir");
    setState(() {
      cityName = "izmir";
      temp = w.temperature.celsius.round();
      weather_icon = w.weatherIcon;
      weatherIconController(weather_icon);
    });
  }

  weatherIconController(String icon)
  {
    setState(() {
      if(icon == "01d")//sunny
          {
         image_path = "images/sunny.png";
         background_path ="images/sunnyBackground.jpg";
         text_color = Colors.black;
      }
      if(icon == "01n")//night
          {
        image_path = "images/night.png";
        background_path ="images/nightBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "02d")//parçalı bulutlu
          {
        image_path = "images/partCloud.png";
        background_path ="images/cloudBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "02n")// bulutlu gece
          {
        image_path = "images/partCloudNight.png";
        background_path ="images/nightBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "03d")//çok bulutlu
          {
        image_path = "images/cloudy.png";
        background_path ="images/cloudBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "03n")//paraçalı bulutlu gece
          {
        image_path = "images/cloudy.png";
        background_path ="images/nightBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "04d")//bulutlu
          {
        image_path = "images/cloudy.png";
        background_path ="images/cloudBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "04n")//bulutlu gece
          {
        image_path = "images/cloudy.png";
        background_path ="images/nightBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "09d")//güneşli yağmurlu
          {
        image_path = "images/sunnyRainy.png";
        background_path ="images/sunnyRainyBackground.jpg";
        text_color = Colors.black;
      }
      if(icon == "09n")//gece yağmurlu
          {
        image_path = "images/nightRainy.png";
        background_path ="images/nightRainyBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "10d")//gündüze sağanak yağış
          {
        image_path = "images/sunnyThunder.png";
        background_path ="images/rainyThunderBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "10n")//gece sağanak yağışlı
          {
        image_path = "images/nightThunder.png";
        background_path ="images/rainyThunderBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "11d")//
          {
        image_path = "images/thunder.png";
        background_path ="images/rainyThunderBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "11n")//
          {
        image_path = "images/thunder.png";
        background_path ="images/rainyThunderBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "13d")//gündüz karlı
          {
        image_path = "images/sunnySnowy.png";
        background_path ="images/snowyBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "13n")//gece karlı
          {
        image_path = "images/nightSnowy.png";
        background_path ="images/nightSnowyBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "14d")//gündüz rüzgarlı
          {
        image_path = "images/windy.png";
        background_path ="images/windyBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "14n")//gece rüzgarlı
          {
        image_path = "images/storm.png";
        background_path ="images/windyBackground.jpg";
        text_color = Colors.white;
      }
      if(icon == "50d" || icon == "50n")
        {
          image_path = "images/foggy.png";
          background_path = "images/mistBackground.jpg";
          text_color = Colors.white;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    forecastInitial();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  background_path
                ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 120, 100),
                            alignment: Alignment.centerLeft,
                            height: 100,
                            width: 100,
                            color: Colors.red.withOpacity(0),
                            child: IconButton(iconSize: 60,icon: Icon(Icons.near_me,color: text_color,),
                                onPressed: ()=> getYourForecast()
                            ),
                          ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                        height: 100,
                        width: 100,
                        color: Colors.blue.withOpacity(0),
                        child: IconButton(iconSize: 60,icon: Icon(Icons.location_city,color: text_color,),
                          onPressed: () async
                            {
                              var result = await Navigator.push(context, MaterialPageRoute(builder: (context)
                              {
                                return searchScreen();
                              }));

                              Weather w = await wf.currentWeatherByCityName(result.toString());

                              setState(() {
                                if(result != null)
                                  {
                                    cityName = result;
                                    temp = w.temperature.celsius.round();
                                    weather_icon = weather_icon;
                                    weatherIconController(weather_icon);
                                    description = w.weatherDescription;
                                  }
                              });
                            }
                      ),
                      ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.green.withOpacity(0),
                            child: Text(cityName[0].toUpperCase()+""+cityName.substring(1),textAlign: TextAlign.center,style: TextStyle(fontSize:42,color: text_color,fontWeight: FontWeight.w600),),
                          ),
                        ),
                      ),
                  ),
                   Expanded(
                     flex: 2,
                     child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          color: Colors.yellow.withOpacity(0),
                          alignment: Alignment.center,
                          child: Text(temp.toString()+"°C",textAlign:TextAlign.center,style: TextStyle(color: text_color,fontSize: 35.0,fontWeight: FontWeight.w700) ,),
                        ),
                      ),
                   ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 40, 70, 40),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        image: DecorationImage(image: AssetImage(image_path)),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 3,
                          ),
                        ]
                    ),
                  ),
                ),
              ),
              Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment.topCenter,
                          child: Text(description,textAlign:TextAlign.center,style: TextStyle(color: text_color,fontSize: 35.0,fontWeight: FontWeight.w700),),
                          color: Colors.yellow.withOpacity(0),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
  }
}
