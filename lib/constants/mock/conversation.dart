import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/constants/mock/user.dart';

class Conversation {
  String id;
  List<User> participants;
  DateTime createdAt;
  List<Message> messages;

  Conversation(
      {@required this.id,
      @required this.participants,
      @required this.createdAt,
      @required this.messages,
      Key key});

  List<User> get getParticipantsExceptCurrentUser {
    List<User> filteredParticipants = this
        .participants
        .where((user) => user.id != UserMockData().currentUser.id)
        .toList();
    return filteredParticipants.isEmpty
        ? <User>[UserMockData().currentUser]
        : filteredParticipants;
  }

  Conversation get getFilterConversation {
    return Conversation(
        id: this.id,
        participants: this.getParticipantsExceptCurrentUser,
        createdAt: this.createdAt,
        messages: this.messages);
  }
}

class GroupConversation extends Conversation {
  final String groupName;

  GroupConversation(
      {Key key,
      id,
      participants,
      createdAt,
      messages,
      @required this.groupName})
      : super(
            id: id,
            participants: participants,
            createdAt: createdAt,
            messages: messages,
            key: key);
}
