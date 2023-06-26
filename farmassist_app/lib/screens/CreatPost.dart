import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _thumbnailImage;

  Future<void> _pickThumbnailImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _thumbnailImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _createPost() async {
    if (_formKey.currentState!.validate()) {
      final formData = FormData();

      formData.fields.add(MapEntry('title', _titleController.text));
      formData.fields.add(MapEntry('description', _descriptionController.text));

      if (_thumbnailImage != null) {
        formData.files.add(MapEntry(
          'thumbnail',
          await MultipartFile.fromFile(_thumbnailImage!.path),
        ));
      }

      try {
        // Replace the URL with your endpoint URL
        final response = await Dio()
            .post('https://example.com/api/create-post', data: formData);
        // Handle response
      } catch (e) {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _pickThumbnailImage,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _thumbnailImage != null
                      ? Image.file(_thumbnailImage!, fit: BoxFit.cover)
                      : Icon(Icons.image, size: 64.0),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _createPost,
                child: Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
