import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmassist_app/helpers/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

const apiKey = '6e730da37b1c2d002ea75b9cb132e747';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? latitude;
  double? longitude;
  var temp;
  var description;
  var cityName;
  var currently;
  var humidity;
  var windSpeed;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentPosition();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric"));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      setState(() {
        this.temp = decodedData['main']['temp'];
        this.description = decodedData['weather'][0]['description'];
        this.currently = decodedData['weather'][0]['main'];
        this.cityName = decodedData['name'];
        this.humidity = decodedData['main']['humidity'];
        this.windSpeed = decodedData['wind']['speed'];
      });

      //   print(temp);
      //   print(description);
      //   print(cityName);
      //  print(data);
    } else {
      print(response.statusCode);
    }
    //var results = jsonDecode(response.body);
    // setState(() {
    //   this.temp = results['main']['temp'];
    //   this.description = results['weather'][0]['description'];
    //   this.currently = results['weather'][0]['main'];
    //   this.humidity = results['main']['humidity'];
    //   this.windSpeed = results['wind']['speed'];
    // });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            
          ],
        
        ),
        Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    color: const Color.fromARGB(100, 241, 241, 241),
                    child: Text(
                      cityName != null ? cityName.toString() : "loading",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "loading",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "loading",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
               color: Color.fromARGB(100, 225, 225, 225),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.thermostat_outlined,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Temparature",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      temp != null ? temp.toString() + "\u00B0" : "loding",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
               color: Color.fromARGB(100, 225, 225, 225),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.cloud,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Weather",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      description != null ? description.toString() : "loading",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
               color: Color.fromARGB(100, 225, 225, 225),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.opacity,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "humdity",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      humidity != null ? humidity.toString() : "loading",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
               color: Color.fromARGB(100, 225, 225, 225),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.wind_power_sharp,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "wind speed",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      windSpeed != null ? windSpeed.toString() : "loading",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
