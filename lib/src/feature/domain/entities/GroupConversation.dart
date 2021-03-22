import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/feature/domain/entities/conversation.dart';

class GroupConversation extends Conversation {
  final String name;
  final dynamic owner;

  GroupConversation(
      {Key key,
      id,
      participants,
      createdAt,
      messages,
      @required this.name,
      @required this.owner})
      : super(
            id: id,
            participants: participants,
            createdAt: createdAt,
            messages: messages,
            key: key);
}
