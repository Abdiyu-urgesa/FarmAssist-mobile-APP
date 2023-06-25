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
      if (mounted) {
        setState(() {
          this.temp = decodedData['main']['temp'];
          this.description = decodedData['weather'][0]['description'];
          this.currently = decodedData['weather'][0]['main'];
          this.cityName = decodedData['name'];
          this.humidity = decodedData['main']['humidity'];
          this.windSpeed = decodedData['wind']['speed'];
        });
      }
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
        Container(
           margin:EdgeInsets.only(bottom: 15),
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Color.fromARGB(100, 225, 225, 225),
          padding: EdgeInsets.only(left:15,right:15,top:5,bottom:5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.cloudy_snowing,
                      size: 30,
                      color: Colors.blue.shade200,
                    ),
                    SizedBox(width: 10),
                    Text(
                      cityName != null ? cityName.toString() : "loading",
                      style: TextStyle(
                          color: Colors.blue[500],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                   
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height:35,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.thermostat,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    temp != null ? temp.toString() + "\u00B0" : "loding",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left:15,right:15,top:5,bottom:5),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.cloud,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Weather",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          description != null
                              ? description.toString()
                              : "loading",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.opacity,
                      size: 20,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "humdity",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        humidity != null ? humidity.toString() : "loading",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.wind_power_sharp,
                      size: 20,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "wind speed",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        windSpeed != null
                            ? windSpeed.toString()
                            : "loading",
                        style:const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
