import 'package:flutter/material.dart';

abstract class Conversation {
  String id;
  List<dynamic> participants;
  DateTime createdAt;
  List<dynamic> messages;

  Conversation(
      {@required this.id,
      @required this.participants,
      @required this.createdAt,
      @required this.messages,
      Key key});
}