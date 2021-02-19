import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/chat/ChatBubble.dart';
import 'package:flutter_chat_v2/components/chat/ChatComposer.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/constants/mock/user.dart';

enum ChatBubblePosition { first, middle, last }

class ConversationScreen extends StatefulWidget {
  final Conversation conversation;
  ConversationScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;

    Widget _getAppBar() {
      return AppBar(
        title: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.conversation
                      .getParticipantsExceptCurrentUser[0].imageURL),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget
                      .conversation.getParticipantsExceptCurrentUser[0].name),
                  Row(
                    children: [
                      Text(
                        languageJumbotron["status-online"],
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2, left: 3),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          "12",
                          style: TextStyle(color: Colors.green, fontSize: 7),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            print("Current Avatar tapped!");
          },
          child: Container(
              margin: EdgeInsets.only(top: 10, left: 13, bottom: 10, right: 13),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ),
        actions: [
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          IconButton(
            icon: Icon(CupertinoIcons.video_camera_solid),
            onPressed: () {},
            iconSize: 32,
          )
        ],
      );
    }

    List<Message> conversationMessages = widget.conversation.messages;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: _getAppBar(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      ChatBubblePosition getPosition() {
                        ChatBubblePosition pos;
                        if (index < 1) {
                          pos = ChatBubblePosition.first;
                        } else if (index == conversationMessages.length - 1) {
                          pos = ChatBubblePosition.last;
                        } else {
                          User prevSender =
                              conversationMessages[index - 1].sender;
                          User curSender = conversationMessages[index].sender;
                          User nextSender =
                              conversationMessages[index + 1].sender;
                          if (curSender.id != prevSender.id) {
                            pos = ChatBubblePosition.first;
                          } else if (curSender.id == prevSender.id &&
                              curSender.id == nextSender.id) {
                            pos = ChatBubblePosition.middle;
                          } else if (curSender.id != nextSender.id) {
                            pos = ChatBubblePosition.last;
                          }
                        }
                        return pos;
                      }

                      return ChatBubble(
                          message: conversationMessages[index],
                          messagePosition: getPosition());
                    },
                    itemCount: conversationMessages.length),
              ),
              ChatComposer()
            ],
          ),
        ));
  }
}
