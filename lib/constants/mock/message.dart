import 'package:flutter/material.dart' show required;
import 'package:flutter_chat_v2/constants/mock/user.dart';

class Message {
  DateTime dateTime;
  User sender;
  bool unread;
  String text;

  Message(
      {@required this.dateTime,
      @required this.sender,
      @required this.unread,
      @required this.text});
}
