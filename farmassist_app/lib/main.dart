import 'package:farmassist_app/route_generator.dart';
import 'package:farmassist_app/screens/feed.dart';
import 'package:farmassist_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _current_tab = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Lang"),
              Icon(
                Icons.notifications,
                size: 25,
                color: Colors.grey.shade600,
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.green.shade200,
          animationDuration: const Duration(milliseconds: 300),
          height: 55.0,
          onTap: (index) {
            setState(() {
              _current_tab = index;
            });
          },
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.green.shade900,
            ),
            Icon(
              Icons.crop_free,
              size: 30,
              color: Colors.green.shade900,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.green.shade900,
            ),
          ],
        ),
        body: SafeArea(
          child: Builder(builder: (BuildContext context) {
            if (_current_tab == 0) {
              return ScanningPage();
            }
            if (_current_tab == 1) {
              return ScanningPage();
            }
            if (_current_tab == 2) {
              return FeedPage();
            } else {
              return ScanningPage();
            }
          }),
        ));
  }
}
