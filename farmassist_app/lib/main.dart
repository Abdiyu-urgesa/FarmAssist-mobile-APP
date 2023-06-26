import 'package:farmassist_app/componenets/langDropdown.dart';
import 'package:farmassist_app/l10n/I10n.dart';
import 'package:farmassist_app/route_generator.dart';
import 'package:farmassist_app/screens/FeedPage.dart';

import 'package:farmassist_app/screens/home.dart';
import 'package:farmassist_app/helpers/l10nprovider.dart';
import 'package:farmassist_app/screens/loginPage.dart';
import 'package:farmassist_app/screens/peofile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:farmassist_app/classes/language_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // This widget is the root of your application.
  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: L10n.all,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
          title: const LanguageDropdown(),
          backgroundColor: const Color.fromARGB(100, 241, 241, 241),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromARGB(100, 241, 241, 241),
          color: Colors.green,
          animationDuration: const Duration(milliseconds: 300),
          height: 55.0,
          onTap: (index) {
            setState(() {
              _current_tab = index;
            });
          },
          items: const <Widget>[
            Icon(
              Icons.home_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.crop_free,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        body: SafeArea(
          child: Builder(builder: (BuildContext context) {
            if (_current_tab == 0) {
              return FeedPage();
            }
            if (_current_tab == 1) {
              return ScanningPage();
            }
            if (_current_tab == 2) {
              return ProfilePage();
            } else {
              return ScanningPage();
            }
          }),
        ));
  }
}
