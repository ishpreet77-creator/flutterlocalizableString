import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'localizable_name.dart';
// import 'package:flutterlocalizationsample/application_localizations_delegate.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    TranslatedStrings.loadTranslations(context);
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Text(TranslatedStrings.playerName),
            // SizedBox(height: 15),
            // Text(appLocalizations?.translate("club_name") ?? ''),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("country")} : ${appLocalizations?.translate("country_portugal")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Divider(thickness: 3),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("player_name")} : ${appLocalizations?.translate("player_name_messi")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("club_name")} : ${appLocalizations?.translate("club_name_barcelona")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("country")} : ${appLocalizations?.translate("country_argentina")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Divider(thickness: 3),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("player_name")} : ${appLocalizations?.translate("player_name_neymar")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("club_name")} : ${appLocalizations?.translate("club_name_psg")}", style: TextStyle(fontSize: 22)),
            // SizedBox(height: 15),
            // Text("${appLocalizations?.translate("country")} : ${appLocalizations?.translate("country_brazil")}", style: TextStyle(fontSize: 22)),
          ],
        ),
      )),
    );
  }
}
