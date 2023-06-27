import 'dart:convert' as convert;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farmassist_app/classes/ApiHelper.dart';
import 'package:farmassist_app/models/Postmode.dart';
import 'package:farmassist_app/models/Predictmodel.dart';
import 'package:http/http.dart' as http;

class servicesApi {
  Api _api = Api();
  Future<List<Postmodel>> fetchData() async {
    print("rruiruirui");
    try {
      final response = await _api.api.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        print(jsonResponse);
        jsonResponse.removeRange(jsonResponse.length - 3, jsonResponse.length);
        final posts =
            jsonResponse.map((json) => Postmodel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Predictmodel> fetchPredictData(imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'file':
            await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      final response = await _api.api
          .post('https://try-api.onrender.com/predict', data: formData);
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        final res = Predictmodel.fromJson(jsonResponse);
        return res;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
