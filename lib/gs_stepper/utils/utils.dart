import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils {
  static bool isRtl(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'fa' ||
        Localizations.localeOf(context).languageCode == 'ar' ||
        Localizations.localeOf(context).languageCode == 'he' ||
        Localizations.localeOf(context).languageCode == 'ps' ||
        Localizations.localeOf(context).languageCode == 'ur' ;

  }
}