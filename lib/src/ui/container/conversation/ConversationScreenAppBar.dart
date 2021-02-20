import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/ui/components/common/UserStatus.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';

class ConversationScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Conversation conversation;
  const ConversationScreenAppBar({Key key, @required this.conversation}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    String formattedStatus = conversation.participants.first.status
        .toString()
        .replaceAll("UserStatus.", "");

    Widget _getStatusUI(UserStatus status) {
      return Container(
        margin: EdgeInsets.only(top: 2, left: 3),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
            color: colorByStatus(status),
            shape: BoxShape.circle,
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2)),
      );
    }

    return AppBar(
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    conversation.participants.first.imageURL),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(conversation.participants.first.name),
                Row(
                  children: [
                    Text(
                      languageJumbotron["status-$formattedStatus"],
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    _getStatusUI(conversation.participants.first.status)
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
