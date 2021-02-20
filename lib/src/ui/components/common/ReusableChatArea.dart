import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/chat/ChatBubble.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/constants/mock/user.dart';
import 'package:flutter_chat_v2/src/ui/screens/ConversationScreen.dart';
class ReusableChatArea extends StatelessWidget {
  final List<Message> conversationMessages;
  const ReusableChatArea({Key key, @required this.conversationMessages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            ChatBubblePosition getPosition() {
              ChatBubblePosition pos;
              if (index < 1) {
                pos = ChatBubblePosition.first;
              } else if (index == conversationMessages.length - 1) {
                pos = ChatBubblePosition.last;
              } else {
                User prevSender = conversationMessages[index - 1].sender;
                User curSender = conversationMessages[index].sender;
                User nextSender = conversationMessages[index + 1].sender;
                if (curSender.id != prevSender.id) {
                  pos = ChatBubblePosition.first;
                } else if (curSender.id == prevSender.id &&
                    curSender.id == nextSender.id) {
                  pos = ChatBubblePosition.middle;
                } else if (curSender.id != nextSender.id) {
                  pos = ChatBubblePosition.last;
                }
              }
              return pos;
            }

            return ChatBubble(
                message: conversationMessages[index],
                messagePosition: getPosition());
          },
          itemCount: conversationMessages.length),
    );
  }
}
