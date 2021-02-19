import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';

class ConversationItemGroup extends StatelessWidget {
  final Conversation conversation;
  const ConversationItemGroup({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(conversation.id),
    );
  }
}
