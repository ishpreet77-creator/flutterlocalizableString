
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppLocalizations {
  final Locale locale;
  static Map<String, dynamic>? _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    
    final defaultLanguage = 'en'; // Set English as the default language

    final jsonString = await rootBundle.loadString('assets/messages_${locale.languageCode}.json').catchError((error) {
      // If the selected language is not supported, load the default language (English)
      return rootBundle.loadString('assets/messages_$defaultLanguage.json');
    });

    // ignore: unnecessary_null_comparison
    if (jsonString != null) {
      _localizedStrings = json.decode(jsonString);
      return true;
    } else {
      // If the asset file couldn't be loaded, set an empty map to avoid null errors
      _localizedStrings = {};
      return false;
    }
  }

  String translate(String key) {
    final translation = _localizedStrings![key];

    if (translation != null) {
      return translation;
    } else {
      // If the translation value is null, fallback to English translation
      final defaultTranslation = _localizedStrings!['en']?[key];
      return defaultTranslation ?? '';
    }
  }
}

