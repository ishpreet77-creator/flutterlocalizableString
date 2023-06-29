import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'application_localizations_delegate.dart';
import 'home.dart';


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
