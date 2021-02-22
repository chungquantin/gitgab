import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/components/chat/ChatBubble.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/src/resources/screens/ConversationScreen.dart';

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
              // ignore: missing_return
              Function getSender(int index, String position) {
                switch (position) {
                  case "prev":
                    return () => conversationMessages[index - 1].sender;
                  case "curr":
                    return () => conversationMessages[index].sender;
                  case "next":
                    return () => conversationMessages[index + 1].sender;
                  default:
                    break;
                }
              }

              void handleLastItemCase() {
                if (index - 1 < 0) {
                  pos = ChatBubblePosition.first;
                } else if (index + 1 > 0) {
                  if (getSender(index, "curr")() !=
                      getSender(index, "prev")()) {
                    pos = ChatBubblePosition.first;
                  } else {
                    pos = ChatBubblePosition.last;
                  }
                }
              }

              void handleMiddleItemCase() {
                if (getSender(index, "curr")().id !=
                    getSender(index, "prev")().id) {
                  pos = ChatBubblePosition.first;
                } else if (getSender(index, "curr")() ==
                        getSender(index, "prev")() &&
                    getSender(index, "curr")().id ==
                        getSender(index, "next")().id) {
                  pos = ChatBubblePosition.middle;
                } else if (getSender(index, "curr")().id !=
                    getSender(index, "next")().id) {
                  pos = ChatBubblePosition.last;
                }
              }

              void handleFirstItemCase() {
                pos = ChatBubblePosition.first;
              }

              if (index < 1) {
                handleFirstItemCase();
              } else if (index == conversationMessages.length - 1) {
                handleLastItemCase();
              } else {
                handleMiddleItemCase();
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
