import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
<<<<<<< HEAD
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
=======
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
>>>>>>> 51eea9053e98d75445eb9500cae1ebd1fa5d365a

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => ScanningPageState();
}

class ScanningPageState extends State<ScanningPage> {

  File? _image;
  final picker = ImagePicker();

Future getImagefromcamera()async{
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
       maxWidth: 256,
       maxHeight: 256,
    );
    
    setState(() {
      if(pickedImage != null){
        _image = File(pickedImage.path);
      }else{}
       
    });

   }
   Future getImagefromGallery()async{
    final pickedImage = await picker.getImage(
      source: ImageSource.gallery,
       
    );
    
    setState(() {
      if(pickedImage != null){
        _image = File(pickedImage.path);
      }else{ }
       
    });

   }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Center(
      child: Container(
        child: Text(AppLocalizations.of(context)!.abdiyu),
      ),
    );
=======
   return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Scan Object",
             style: const TextStyle(
               fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.green
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: const BoxDecoration(
                
		           borderRadius: BorderRadius.all(Radius.circular(30.0)),
               color: Color.fromARGB(179, 133, 133, 133),
               ),
            // child: Center(
            //   child: _image == null ? Text("No Image Selected"): Image.file(_image!),
            // ),
             child: Center(
                  child:_image == null ? Column(
                    
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                   
              
                    children: [
                      Container(
                          // alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 20, top: 70, bottom: 30),
                          
                          height: 30,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              IconButton(
                                padding: (EdgeInsets.only(top: 5, left: 5, right: 20)),  
                              onPressed:  getImagefromGallery, 
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons. add,
                                color: Colors.green,
                                size: 28,
                              ),
                            ),
                              TextButton(
                              onPressed:  getImagefromGallery, 
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Upload",
                                style: const TextStyle(
                                  // fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green
                                ),
                              ))
              
                          ],)
                        
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      const Text(
                        
                        "Take or UPload photo",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(225, 69, 69, 69)
                          
                        ),
                      )
                    ],
                  ):Image.file(_image!)
                  // Container(
                  //   child:Image.file(
                  //     _image!,
                  //     fit: BoxFit.cover,
                  //   ), 
                  // ) 
                ),
          ),
         
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: getImagefromcamera,
              tooltip: "Pick Image from Camera",
              backgroundColor: Color.fromARGB(255, 4, 209, 11),
              foregroundColor: Colors.white,
               elevation: 0,
              child: Icon(
                Icons.camera,

              ),
            ),
            // FloatingActionButton(
            //   onPressed: getImagefromGallery,
            //   tooltip: "pick Image from gallery",
            //   child: Icon(Icons.folder),
            // )
          ],
        )
        
      ],
    ),
   );
>>>>>>> 51eea9053e98d75445eb9500cae1ebd1fa5d365a
  }
}
      
