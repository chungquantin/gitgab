import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/resources/screens/setting/local_widgets/setting_separator.dart';
import 'package:flutter_chat_v2/src/resources/widgets/search_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguagePack LANG = Language.of(context, listen: true).currentLanguagePack;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        title: Text(LANG.jumbotron["language-setting"]),
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
                    LANG.jumbotron["language-search-button-placeholder"],
              )),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  String COUNTRY_CODE = LanguageEnum.values[index]
                      .toString()
                      .replaceAll("LanguageEnum.", "");
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
                                      LANG.language[headers[index]],
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    Text(LANG.local[COUNTRY_CODE],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                                Spacer(),
                                Text(COUNTRY_CODE),
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
