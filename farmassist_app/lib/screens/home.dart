import 'dart:convert';
import 'dart:io';
import 'package:farmassist_app/classes/get.dart';
import 'package:farmassist_app/classes/language_constants.dart';
import 'package:farmassist_app/models/Predictmodel.dart';
import 'package:farmassist_app/screens/currentWeather.dart';
import 'package:farmassist_app/screens/loading_screen.dart';
import 'package:farmassist_app/screens/try_weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../componenets/TopSnackbar.dart';
import 'weatherModel.dart';
import 'package:image_picker/image_picker.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => ScanningPageState();
}

class ScanningPageState extends State<ScanningPage> {
  late Future<Predictmodel>? _predictData = null;

  servicesApi _api = servicesApi();
  File? _image;
  final picker = ImagePicker();
  String? myclass;
  String? confidence;

  // Future<void> sendFormDataWithImage(imageFile) async {
  //   print("apiiiiiiii");
  //   final url = Uri.parse('https://try-api.onrender.com/predict');

  //   final request = http.MultipartRequest('POST', url);
  //   request.files.add(http.MultipartFile.fromBytes(
  //     'file',
  //     await imageFile.readAsBytes(),
  //     filename: 'image.jpg',
  //   ));

  //   final response = await request.send();

  //   if (response.statusCode == 200) {
  //     final responseBody = await response.stream.bytesToString();
  //     final responseData = json.decode(responseBody);
  //     setState(() {
  //       myclass = responseData['class'];
  //       confidence = responseData['confidence'];
  //     });

  //   } else {
  //     const TopSnackBar(
  //       message: 'Hello, world!',
  //       icon: Icons.info,
  //     );
  //     // Handle the API error response
  //   }
  // }

  Future getImagefromcamera() async {
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 256,
      maxHeight: 256,
    );
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _predictData = _api.fetchPredictData(_image);
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
        _predictData = _api.fetchPredictData(_image);
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
                                child: Text(
                                  translation(context).upload,
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
                                  children: [
                                    Image(
                                      image: AssetImage("assets/Group 196.png"),
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      translation(context)
                                          .youdonthaveanyplantsphoto,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 69, 69, 69)),
                                    ),
                                    Text(
                                      translation(context).addyourplantnow,
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
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              if (_image != null)
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(100, 225, 225, 225),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: FutureBuilder(
                      future: _predictData,
                      builder: (BuildContext context,
                          AsyncSnapshot<Predictmodel> snapshot) {
                        if (snapshot.hasData) {
                          final rec = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translation(context).classs,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      rec!.classs.toString(),
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
                                      translation(context).confidence,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      rec.confidence!,
                                      style: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(snapshot.error.toString()),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });
                          return Text('Error');
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
