import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/constants/mock/user.dart';
import 'package:flutter_chat_v2/core/utils/isCurrentUser.dart';
import 'package:flutter_chat_v2/src/resources/widgets/UserStatus.dart';
import 'package:flutter_chat_v2/src/utils/stringFormatter.dart';

class ConversationItem extends StatelessWidget {
  final Conversation conversation;
  const ConversationItem({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    User to = this.conversation.participants.first;
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    Message lastMessage =
        this.conversation.messages[this.conversation.messages.length - 1];

    Widget buildLeading() {
      return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(to.imageURL),
              radius: 30,
            ),
          ),
          UserStatusComp(
            status: isCurrentUser(to) ? UserStatus.none : to.status,
          )
        ],
      );
    }

    Widget buildContent() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Text(
                to.name,
                style: Theme.of(context).textTheme.headline3,
              ),
            )),
            Expanded(
                child: Container(
              child: Text(
                stringFormatter(
                    (isCurrentUser(lastMessage.sender)
                            ? "${languageJumbotron["you"]}: "
                            : "${lastMessage.sender.name}: ") +
                        lastMessage.text,
                    30),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )),
          ],
        ),
      );
    }

    Widget buildTrailing() {
      return this.conversation.messages.any((msg) => msg.unread == true) &&
              !isCurrentUser(to)
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                this
                    .conversation
                    .messages
                    .where((msg) => msg.unread == true)
                    .toList()
                    .length
                    .toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
          : Container();
    }

    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLeading(),
          buildContent(),
          Spacer(),
          buildTrailing(),
        ],
      ),
    );
  }
}
