import 'package:farmassist_app/l10n/I10n.dart';

import 'package:flutter/foundation.dart';

class I10nprovider with ChangeNotifier {
  String? _locale;
  String? get locale => _locale;

  void setLocale(String locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
