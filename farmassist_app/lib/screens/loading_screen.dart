// import 'package:farmassist_app/utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmassist_app/models/weather.dart';

import 'package:flutter/material.dart';
import 'package:farmassist_app/helpers/location.dart';
import 'package:farmassist_app/helpers/networking.dart';
const apiKey = '6e730da37b1c2d002ea75b9cb132e747';


class LoadingScreen extends StatefulWidget {


  
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  double? latitude;
  double? longitude;
   @override
   void initState(){
    super.initState();
    getLocation();
    
   
   }
  void getLocation() async{
    Location location = Location();

    await location.getCurrentPosition();

    latitude = location.latitude;
    longitude = location.longitude;
   
  
  }
  void getData() async{
    http.Response response =await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    print(response.body);
    
    
    if (response.statusCode == 200){
       String data2 = response.body;
    
      //  var decodedData2 = jsonDecode(data2);
    
      // double temperature2 = decodedData2['main']['temp'];
      // int condition2 = decodedData2['weather'][0]['id'];
      // String cityName2 = decodedData2['name'];
    
      // print(temperature2);
      // print(condition2);
      // print(cityName2);
        
        }else{
        print(response.statusCode);
    
       }
  }
  @override
  Widget build(BuildContext context) {
   
    getData();
    
    return  Container(
      // child: SafeArea(
      //    minimum: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //            ElevatedButton(
      //             onPressed: () {},
      //             child: Icon(
      //               Icons.near_me,
      //               size: 25.0,
      //             ),
      //           ),
      //            ElevatedButton(
      //             onPressed: () {},
      //             child: Icon(
      //               Icons.location_city,
      //               size: 25.0,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 15.0),
      //         child: Row(
      //           children: <Widget>[
      //             Text(
      //               '32°',
      //               style: kTempTextStyle,
      //             ),
      //             Text(
      //               '☀️',
      //               style: kConditionTextStyle,
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(right: 10.0),
      //         child: Text(
      //           "It's 🍦 time in San Francisco!",
      //           textAlign: TextAlign.right,
      //           style: kMessageTextStyle,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}