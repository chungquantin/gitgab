import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/chat/ChatComposer.dart';
import 'package:flutter_chat_v2/components/common/ReusableChatArea.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';

class GroupConversationScreen extends StatefulWidget {
  final Conversation conversation;
  GroupConversationScreen({Key key, @required this.conversation})
      : super(key: key);

  @override
  _GroupConversationScreenState createState() =>
      _GroupConversationScreenState();
}

class _GroupConversationScreenState extends State<GroupConversationScreen> {
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
                        widget.conversation.participants.length.toString() +
                            (widget.conversation.participants.length > 1
                                ? languageJumbotron["group-members"]
                                : languageJumbotron["group-member"]),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
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

    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: _getAppBar(),
        body: Container(
          child: Column(
            children: [
              ReusableChatArea(
                  conversationMessages: widget.conversation.messages),
              ChatComposer()
            ],
          ),
        ));
  }
}
