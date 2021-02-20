import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';

class GroupConversaionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Conversation conversation;
  const GroupConversaionAppBar({Key key, @required this.conversation}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    return AppBar(
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: NetworkImage(conversation.getParticipantsExceptCurrentUser[0].imageURL),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(conversation.getParticipantsExceptCurrentUser[0].name),
                Row(
                  children: [
                    Text(
                      conversation.participants.length.toString() +
                          (conversation.participants.length > 1
                              ? languageJumbotron["group-contributors"]
                              : languageJumbotron["group-contributor"]),
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
}
