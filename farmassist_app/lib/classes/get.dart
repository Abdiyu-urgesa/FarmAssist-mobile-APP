import 'dart:convert' as convert;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farmassist_app/classes/ApiHelper.dart';
import 'package:farmassist_app/models/Postmode.dart';
import 'package:http/http.dart' as http;

class servicesApi {
  Api _api = Api();
  Future<List<Postmodel>> fetchData() async {
    try {
      final response = await _api.api.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        final posts =
            jsonResponse.map((json) => Postmodel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch data: $e');
    }
  }
}
