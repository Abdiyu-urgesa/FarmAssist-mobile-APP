import 'package:farmassist_app/l10n/I10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
