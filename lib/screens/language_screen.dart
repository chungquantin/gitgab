import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        title: Text(languageJumbotron["language-setting"]),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
    );
  }
}
