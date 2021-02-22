import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/resources/components/conversation/GroupConversationAvatar.dart';
import 'package:flutter_chat_v2/src/resources/container/conversation/common/AppBarLeading.dart';

class GroupConversaionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final GroupConversation conversation;
  const GroupConversaionAppBar({Key key, @required this.conversation})
      : super(key: key);

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
                child: GroupConversationAvatar(
                    radius: 21, groupName: conversation.groupName)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(conversation.groupName),
                Row(
                  children: [
                    Text(
                      conversation.participants.length.toString() +
                          " " +
                          (conversation.participants.length > 1
                                  ? languageJumbotron["group-members"]
                                  : languageJumbotron["group-member"])
                              .toString()
                              .toLowerCase(),
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
      leading: AppBarLeading(),
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
