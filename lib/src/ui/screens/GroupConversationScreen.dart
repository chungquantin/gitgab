import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/chat/ChatComposer.dart';
import 'package:flutter_chat_v2/src/ui/components/common/ReusableChatArea.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/ui/container/conversation/GroupConversationAppBar.dart';

class GroupConversationScreen extends StatefulWidget {
  final Conversation conversation;
  GroupConversationScreen({Key key, @required this.conversation})
      : super(key: key);

  @override
  _GroupConversationScreenState createState() =>
      _GroupConversationScreenState();
}

class _GroupConversationScreenState extends State<GroupConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: GroupConversaionAppBar(conversation: widget.conversation),
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
