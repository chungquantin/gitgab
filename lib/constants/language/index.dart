import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/en.dart';
import 'package:flutter_chat_v2/constants/language/kr.dart';
import 'package:flutter_chat_v2/constants/language/vn.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/utils/assetUtil.dart';
import 'package:provider/provider.dart';

enum LanguageEnum { VN, EN, KR }

class Language extends ChangeNotifier {
  LanguageEnum language = UserMockData().currentUserSetting.language;
  List<String> headers = ["language-VN", "language-EN", "language-KR"];
  List<Widget> flagIcons = [flagImage("vn"), flagImage("en")];

  Language();

  List<String> get getHeader {
    return this.headers;
  }

  static Language of(BuildContext context, {bool listen = false}) =>
      Provider.of<Language>(context, listen: listen);

  void setLanguage(LanguageEnum _lang) {
    language = _lang;
    notifyListeners();
  }

  LanguagePack get currentLanguagePack {
    switch (this.language) {
      case LanguageEnum.VN:
        return VN();
      case LanguageEnum.EN:
        return EN();
      case LanguageEnum.KR:
        return KR();
      default:
        return EN();
    }
  }
}

class LanguagePack {
  Map<String, String> jumbotron;
  Map<String, String> local;
  Map<String, String> language = {
    "language-VN": "Tiếng Việt",
    "language-EN": "English",
    "language-KR": "한국어"
  };
}
