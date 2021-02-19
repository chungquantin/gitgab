import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_v2/language/constants.dart';

Future<String> loadJsonFromAsset(language) async {
  return await rootBundle.loadString('assets/i18n/' + language + '.json');
}


Map<String, String> convertValueToString(obj) {
  Map<String, String> result = {};
  obj.forEach((key, value) {
    result[key] = value.toString();
  });
  return result;
}

Future<Map<String, Map<String, String>>> initializeI18n() async {
  Map<String, Map<String, String>> values = {};
  for (String language in languages) {
    Map<String, dynamic> translation =
        json.decode(await loadJsonFromAsset(language));
    values[language] = convertValueToString(translation);
  }
  return values;
}