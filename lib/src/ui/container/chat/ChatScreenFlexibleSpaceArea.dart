import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/common/ReusableSearchBar.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';

class ChatScreenFlexibleSpaceArea extends StatelessWidget {
  const ChatScreenFlexibleSpaceArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;
    return FlexibleSpaceBar(
      centerTitle: true,
      background: SafeArea(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Container(
                  margin: EdgeInsets.only(top: 60, right: 20, left: 20),
                  child: ReusableSearchBar(
                      onChangeEvent: (value) {
                        print(value);
                      },
                      placeholder:
                          languageJumbotron["search-button-placeholder"])))),
    );
  }
}
