import 'package:flutter/material.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String dropdownvallue = "one";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
          value: dropdownvallue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownvallue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem(value: "one", child: Text("one")),
            DropdownMenuItem(value: "two", child: Text("two"))
          ]),
    );
  }
}
