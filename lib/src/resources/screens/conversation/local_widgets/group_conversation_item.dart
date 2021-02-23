import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/core/utils/isCurrentUser.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/group_conversation_avatar.dart';
import 'package:flutter_chat_v2/src/resources/widgets/UserStatus.dart';
import 'package:flutter_chat_v2/src/utils/stringFormatter.dart';

class GroupConversationItem extends StatelessWidget {
  final GroupConversation conversation;
  const GroupConversationItem({Key key, @required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    Message lastMessage =
        this.conversation.messages[this.conversation.messages.length - 1];
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 15),
                  child: GroupConversationAvatar(
                      radius: 30, groupName: conversation.groupName)),
              UserStatusComp(
                status: conversation.participants.any((participant) =>
                        participant.status == UserStatus.online)
                    ? lastMessage.sender.status
                    : UserStatus.none,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    conversation.groupName,
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
          ),
          Spacer(),
          this.conversation.messages.any((msg) => msg.unread == true) &&
                  !isCurrentUser(lastMessage.sender)
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
              : Container()
        ],
      ),
    );
  }
}
