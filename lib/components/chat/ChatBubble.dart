import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/screens/ConversationScreen.dart';
import 'package:flutter_chat_v2/utils/isCurrentUser.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final ChatBubblePosition messagePosition;
  ChatBubble({Key key, @required this.message, @required this.messagePosition})
      : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  Widget _notMeMessage() => Container(
        margin: EdgeInsets.only(
            top: widget.messagePosition == ChatBubblePosition.first ? 10 : 0,
            left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.messagePosition == ChatBubblePosition.first
                ? Container(
                    margin: EdgeInsets.only(right: 25),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.message.sender.imageURL),
                      radius: 20,
                    ),
                  )
                : Container(
                    width: 65,
                  ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                margin: EdgeInsets.only(
                    top: widget.messagePosition == ChatBubblePosition.first
                        ? 15
                        : 6,
                    right: 80),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  widget.message.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );

  Widget _meMessage() => Container(
        margin: widget.messagePosition == ChatBubblePosition.first
            ? EdgeInsets.only(top: 10)
            : EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                margin: EdgeInsets.only(
                    top: widget.messagePosition == ChatBubblePosition.first
                        ? 15
                        : 6,
                    left: 120,
                    right: 15),
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(10))),
                child: Text(
                  widget.message.text,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return isCurrentUser(widget.message.sender)
        ? _meMessage()
        : _notMeMessage();
  }
}
