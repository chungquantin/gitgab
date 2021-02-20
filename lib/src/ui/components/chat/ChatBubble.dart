import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/src/ui/screens/ConversationScreen.dart';
import 'package:flutter_chat_v2/utils/date.dart';
import 'package:flutter_chat_v2/core/utils/isCurrentUser.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final ChatBubblePosition messagePosition;
  ChatBubble({Key key, @required this.message, @required this.messagePosition})
      : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool infoShowed = false;
  // TODO(chase): Animation on info appear
  Widget _meridium() => Container(
        margin: EdgeInsets.only(top: 10, bottom: 5),
        child: Text(
          DateFormat("hh:mm").format(widget.message.dateTime) +
              " " +
              getMeridiem(widget.message.dateTime),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
  Widget _name() => Container(
      margin: EdgeInsets.only(top: 5, bottom: 7),
      child: Text(widget.message.sender.name,
              style: Theme.of(context).textTheme.bodyText1));
  Widget _notMeMessage() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.messagePosition == ChatBubblePosition.first
                ? Container(
                    margin: EdgeInsets.only(right: 10, left: 15, top: 10),
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
                margin: EdgeInsets.only(
                    top: widget.messagePosition == ChatBubblePosition.first
                        ? 15
                        : 6,
                    right: 80,
                    left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoShowed ? _name() : Container(),
                    InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(20)),
                      onTap: () {
                        setState(() {
                          infoShowed = !infoShowed;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                    ),
                    infoShowed ? _meridium() : Container()
                  ],
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
                margin: EdgeInsets.only(
                    top: widget.messagePosition == ChatBubblePosition.first
                        ? 15
                        : 6,
                    left: 120,
                    right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          infoShowed = !infoShowed;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                    infoShowed ? _meridium() : Container()
                  ],
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
