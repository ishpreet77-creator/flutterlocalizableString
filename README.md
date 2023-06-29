# Flutter-Localization-Sample
This example demonstrates how to use localization in flutter application.

## Add required library under dependencies section in pubspec file
```gradle
flutter_localizations:
    sdk: flutter
```

## Create Json Files For Supported Languages

en.json For English
```json
{
  "player_name": "Player Name",
  "club_name": "Club Name",
  "country": "Country"
}
```
es.json For Spanish
```json
{
  "player_name": "Nombre del jugador",
  "club_name": "Nombre del club",
  "country": "País"
}
```
fr.json For French
```json
{
  "player_name": "Nom de joueur",
  "club_name": "Nom du club",
  "country": "Pays"
}
```
## Set Json Files Paths in pubspec file
```yaml
 assets:
    - assets/messages_en.json
    - assets/messages_es.json
    - assets/messages_fr.json
```

## Create Classes For Localization
```dart

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


```

```dart
import 'package:flutter/cupertino.dart';
import 'application_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'fr',
      'es'
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

```

## Integrate Localization in main.dart file
```dart

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('es'),
      ],
      home: Home(),
    );
  }
}

```

## set  string on the variable
```dart
import 'package:flutter/cupertino.dart';
import 'application_localizations.dart';

class TranslatedStrings {
  static String playerName = '';
  static String clubName = '';
 

  static void loadTranslations(BuildContext context) async {
    final appLocalizations = AppLocalizations.of(context);

    if (appLocalizations != null) {
      playerName = appLocalizations.translate("player_name") ?? '';
      clubName = appLocalizations.translate("club_name") ?? '';
      
    }
  }
}
```
## set varivale on the screen

 Text(TranslatedStrings.playerName) 

 //also call the function before translating the value
 
 TranslatedStrings.loadTranslations(context);

 


