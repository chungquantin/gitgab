import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/common/ReusableSearchBar.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/ui/components/setting/SettingSeparator.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        title: Text(languageJumbotron["language-setting"]),
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
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      Language.of(context)
                          .setLanguage(LanguageEnum.values[index]);
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Language.of(context)
                                          .currentLanguagePack
                                          .language[headers[index]],
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Text("Vietnamese",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                                Spacer(),
                                Text(LanguageEnum.values[index]
                                    .toString()
                                    .replaceAll("LanguageEnum.", "")),
                              ]),
                        ),
                        index != LanguageEnum.values.length - 1
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: SettingSeparator())
                            : Container()
                      ],
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
