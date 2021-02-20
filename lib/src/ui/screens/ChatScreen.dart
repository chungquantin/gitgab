import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/conversation/ConversationItem.dart';
import 'package:flutter_chat_v2/src/ui/components/conversation/ConversationItemGroup.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/src/ui/container/chat/ChatScreenSliverAppBar.dart';
import 'package:flutter_chat_v2/src/ui/screens/ConversationScreen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Conversation> conversationByCurrentUser =
        UserMockData().currentUser.getConversation;
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        ChatScreenSliverAppBar(),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          Conversation currentConversation = conversationByCurrentUser[index];
          Widget conversationComponent;
          if (currentConversation.getParticipantsExceptCurrentUser.length <= 1) {
            conversationComponent = ConversationItem(
              conversation: currentConversation.getFilterConversation,
            );
          } else {
            conversationComponent = ConversationItemGroup(
              conversation: currentConversation
            );
          }
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConversationScreen(
                            conversation:
                                currentConversation.getFilterConversation,
                          ))),
              child: conversationComponent);
        }, childCount: conversationByCurrentUser.length))
      ],
    );
  }
}
