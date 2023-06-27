import 'package:dio/dio.dart';
import 'getToken.dart';

class Api {
  final Dio api = Dio();
  final accessToken = getToken('token');

  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = 'https://farmawebapp.onrender.com${options.path}';
      }
      // if (accessToken.toString() != "") {
      //   options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
      // }
    }));
  }
}
