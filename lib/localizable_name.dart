import 'package:flutter/cupertino.dart';
import 'application_localizations.dart';

class TranslatedStrings {
  static String playerName = '';
  static String clubName = '';
  static String country = '';
  static String countryPortugal = '';
  static String playerNameMessi = '';
  static String clubNameBarcelona = '';
  static String countryArgentina = '';
  static String playerNameNeymar = '';
  static String clubNamePSG = '';
  static String countryBrazil = '';

  static void loadTranslations(BuildContext context) async {
    final appLocalizations = AppLocalizations.of(context);

    if (appLocalizations != null) {
      playerName = appLocalizations.translate("player_name") ?? '';
      clubName = appLocalizations.translate("club_name") ?? '';
      country = appLocalizations.translate("country") ?? '';
      countryPortugal = appLocalizations.translate("country_portugal") ?? '';
      playerNameMessi = appLocalizations.translate("player_name_messi") ?? '';
      clubNameBarcelona = appLocalizations.translate("club_name_barcelona") ?? '';
      countryArgentina = appLocalizations.translate("country_argentina") ?? '';
      playerNameNeymar = appLocalizations.translate("player_name_neymar") ?? '';
      clubNamePSG = appLocalizations.translate("club_name_psg") ?? '';
      countryBrazil = appLocalizations.translate("country_brazil") ?? '';
    }
  }
}
