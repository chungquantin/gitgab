import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/common/ReusableSearchBar.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 30),
              child: ReusableSearchBar(
                onChangeEvent: (value) {
                  print("value");
                },
                placeholder:
                    languageJumbotron["language-search-button-placeholder"],
              )),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  List<String> headers = Language.of(context).getHeader;
                  List<Widget> flags = Language.of(context).flagIcons;
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Language.of(context)
                              .currentLanguagePack
                              .jumbotron[headers[index]]),
                          Text(" - "),
                          Text(LanguageEnum.values[index]
                              .toString()
                              .replaceAll("LanguageEnum.", "")),
                          Spacer(),
                          flags[index]
                        ],
                      ),
                    ),
                  );
                },
                itemCount: LanguageEnum.values.length),
          ),
        ],
      ),
    );
  }
}
