import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/group_conversation_avatar.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/reusable_app_bar.dart';

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
    return ReusableAppBar(
        onTapEvent: () {},
        title: conversation.groupName,
        avatar: GroupConversationAvatar(
            radius: 21, groupName: conversation.groupName),
        subWidget: [
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
        ]);
  }
}
