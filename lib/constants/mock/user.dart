import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/common/UserStatus.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/constants/mock/group.dart';
import 'package:flutter_chat_v2/constants/mock/setting.dart';

class User {
  String id;
  String name;
  UserStatus status;
  Group group;
  String imageURL;
  Setting setting;
  List<String> conversations;

  User(
      {@required this.conversations,
      this.name,
      this.group,
      this.status,
      this.imageURL,
      @required this.id,
      this.setting});

  List<Conversation> get getConversation {
    List<Conversation> res = [];
    for (String conversationId in conversations) {
      Conversation foundConversation = ConversationMockData()
          .listOfConversation
          .where((conversation) => conversationId == conversation.id)
          .first;
      res.add(foundConversation);
    }
    return res;
  }

  // TODO Extract to repository

  bool get hasUnreadConversation {
    return this.getConversation.any((conv) => conv.hasUnreadMessage);
  }

  int get countUnreadConversation {
    return this.getConversation.where((conv) => conv.hasUnreadMessage).length;
  }

  int get countTotalUnreadMessage {
    int res = 0;
    this.getConversation.forEach((conv) {
      res += conv.countUnreadMessage;
    });
    return res;
  }
}
