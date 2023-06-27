import 'package:flutter/material.dart';
import "package:farmassist_app/main.dart";

import '../classes/language_constants.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String dropdownvallue = "am";
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton<String>(
            value: dropdownvallue,
            onChanged: (language) async {
              if (language != null) {
                Locale _locale = await setLocale(language);
                MyApp.setLocale(context, _locale);
                setState(() {
                  dropdownvallue = language;
                });
              }
            },
            items: const [
              DropdownMenuItem(
                  value: "am",
                  child: Text(
                    "አማርኛ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color.fromARGB(205, 13, 25, 69)),
                  )),
              DropdownMenuItem(
                  value: "en",
                  child: Text(
                    "english",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color.fromARGB(205, 13, 25, 69)),
                  )),
              DropdownMenuItem(
                  value: "or",
                  child: Text(
                    "oromifa",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color.fromARGB(205, 13, 25, 69)),
                  ))
            ]),
      ],
    );
  }
}
