import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/en.dart';
import 'package:flutter_chat_v2/constants/language/vn.dart';
import 'package:provider/provider.dart';

enum LanguageEnum { VN, EN }

class Language extends ChangeNotifier {
  LanguageEnum language = LanguageEnum.VN;
  List<String> headers = ["language-VN", "language-EN"];
  List<Widget> flagIcons = [
    Image.asset('icons/flags/png/vn.png', package: 'country_icons', scale: 3,),
    Image.asset('icons/flags/png/us.png', package: 'country_icons', scale: 3,),
  ];

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
      default:
        return EN();
    }
  }
}

class LanguagePack {
  Map<String, String> jumbotron;
}
