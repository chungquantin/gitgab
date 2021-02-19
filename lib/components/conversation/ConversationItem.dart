import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/common/UserStatus.dart';
import 'package:flutter_chat_v2/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/utils/isCurrentUser.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';

class ConversationItem extends StatelessWidget {
  final Conversation conversation;
  const ConversationItem({Key key, @required this.conversation})
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
                child: CircleAvatar(
                  backgroundImage: NetworkImage(this.conversation.to.imageURL),
                  radius: 30,
                ),
              ),
              UserStatusComp(
                status: this.conversation.to.status,
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
                    this.conversation.to.name,
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
          this.conversation.messages.any((msg) => msg.unread == true)
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
