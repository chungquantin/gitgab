import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/components/chat/ChatComposer.dart';
import 'package:flutter_chat_v2/src/resources/components/common/ReusableChatArea.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/resources/container/conversation/ConversationScreenAppBar.dart';

enum ChatBubblePosition { first, middle, last }

class ConversationScreen extends StatefulWidget {
  final Conversation conversation;
  ConversationScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: ConversationScreenAppBar(conversation: widget.conversation),
        body: Container(
          child: Column(
            children: [
              ReusableChatArea(
                  conversationMessages: widget.conversation.messages),
              ChatComposer()
            ],
          ),
        ));
  }
}
