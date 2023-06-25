import 'dart:convert';
import 'dart:io';
import 'package:farmassist_app/classes/language_constants.dart';
import 'package:farmassist_app/screens/currentWeather.dart';
import 'package:farmassist_app/screens/loading_screen.dart';
import 'package:farmassist_app/screens/try_weather.dart';
// import 'package:farmassist_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'weatherModel.dart';
import 'package:image_picker/image_picker.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => ScanningPageState();
}

class ScanningPageState extends State<ScanningPage> {
  File? _image;
  final picker = ImagePicker();
  String? myclass;
  String? confidence;

  Future<void> sendFormDataWithImage(imageFile) async {
    print("apiiiiiiii");
    final url = Uri.parse('https://try-api.onrender.com/predict');

    final request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      await imageFile.readAsBytes(),
      filename: 'image.jpg',
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);
      setState(() {
        myclass = responseData['class'];
        confidence = responseData['confidence'];
      });

      print(responseData);
    } else {
      print(response);
      print("no goood");
      // Handle the API error response
    }
  }

  Future getImagefromcamera() async {
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 256,
      maxHeight: 256,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        sendFormDataWithImage(_image);
      } else {}
    });
  }

  Future getImagefromGallery() async {
    final pickedImage = await picker.getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        sendFormDataWithImage(_image);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 241, 241, 241),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WeatherPage(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 16),
              //   child: Center(
              //     child: Text(
              //       translation(context).abdiyu,
              //       style: const TextStyle(
              //           fontSize: 30,
              //           fontWeight: FontWeight.w700,
              //           color: Colors.green),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: 30,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: getImagefromGallery,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 23,
                              ),
                            ),
                            TextButton(
                                onPressed: getImagefromGallery,
                                child: const Text(
                                  "Upload",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ))
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color.fromARGB(100, 225, 225, 225),
                      ),
                      child: Center(
                          child: _image == null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage("assets/Group 196.png"),
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "You don't have any plants photo",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 69, 69, 69)),
                                    ),
                                    Text(
                                      "Add your plant now",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 69, 69, 69)),
                                    )
                                  ],
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Color.fromARGB(100, 225, 225, 225),
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: getImagefromcamera,
                    tooltip: "Pick Image from Camera",
                    backgroundColor: Color.fromARGB(255, 62, 212, 0),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              if (confidence == null)
                const Text('')
              else
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(100, 225, 225, 225),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Class:",
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(width: 15),
                            Text(
                              myclass!,
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Confidence:",
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(width: 15),
                            Text(
                              confidence!,
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
