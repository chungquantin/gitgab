import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/feature/domain/entities/conversation.dart';

class DirectConversation extends Conversation {
  DirectConversation({Key key, id, participants, createdAt, messages})
      : super(
            id: id,
            participants: participants,
            createdAt: createdAt,
            messages: messages,
            key: key);
}
