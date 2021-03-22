import 'package:dartz/dartz.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/core/error/failure.dart';

abstract class ConversationRepository {
  Future<Either<Failure, List<Either<GroupConversation, DirectConversation>>>>
      getConversations();
}
