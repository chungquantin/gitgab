import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/src/resources/screens/chat/local_widgets/chat_sliver_app_bar.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/conversation.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/group_conversation.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/conversation_item.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/group_conversation_item.dart';

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
          Widget conversationScreen;
          if (currentConversation.getParticipantsExceptCurrentUser.length <=
              1) {
            conversationComponent = ConversationItem(
              conversation: currentConversation.getFilterConversation,
            );
            conversationScreen = ConversationScreen(
              conversation: currentConversation.getFilterConversation,
            );
          } else {
            conversationComponent =
                GroupConversationItem(conversation: currentConversation);
            conversationScreen =
                GroupConversationScreen(conversation: currentConversation);
          }
          return InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => conversationScreen)),
              child: conversationComponent);
        }, childCount: conversationByCurrentUser.length))
      ],
    );
  }
}
