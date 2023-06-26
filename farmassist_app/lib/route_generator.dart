import 'package:farmassist_app/classes/getToken.dart';
import 'package:farmassist_app/screens/FeedPage.dart';
import 'package:farmassist_app/screens/home.dart';
import 'package:farmassist_app/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final token = getToken('token');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/feed':
        return MaterialPageRoute(builder: (_) => const FeedPage());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      // case '/appointment':
      //   return MaterialPageRoute(builder: (_) => LoginCardOverlapRoute());
      // case '/booking':
      //   if (args is String) {
      //     return MaterialPageRoute(
      //         builder: (_) => BookingPage(patientId: args));
      //   } else {
      //     return _errorRoute();
      //   }

      // case '/doctors':
      //   return MaterialPageRoute(builder: (_) => DoctorsPage());

      // case '/events':
      //   return MaterialPageRoute(builder: (_) => EventssPage());

      // case '/timetable':
      //   return MaterialPageRoute(builder: (_) => TimetablePage());
      // case '/share':
      //   return MaterialPageRoute(builder: (_) => SharePage());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                'something went wrong while routing',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      );
    });
  }
}
