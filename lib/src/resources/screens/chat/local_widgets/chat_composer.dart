import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';

class ChatComposer extends StatefulWidget {
  ChatComposer({Key key}) : super(key: key);

  @override
  _ChatComposerState createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer>{
  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    return Container(
      height: 60,
      color: Theme.of(context).primaryColor,
      child: Center(
          child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
              iconSize: 25,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: TextFormField(
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.send,
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration.collapsed(
                      hintText: languageJumbotron["chat-composer-placeholder"],
                      hintStyle: TextStyle(color: Colors.grey))),
            )),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
              iconSize: 25,
            ),
          ],
        ),
      )),
    );
  }
}
