import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/shared/reusable_app_bar.dart';
import 'package:flutter_chat_v2/src/resources/widgets/user_status.dart';

class ConversationScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Conversation conversation;
  const ConversationScreenAppBar({Key key, @required this.conversation})
      : super(key: key);

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

    return ReusableAppBar(
        onTapEvent: () {},
        title: conversation.to.name,
        subWidget: [
          Text(
            formattedStatus != "offline"
                ? languageJumbotron["status-$formattedStatus"]
                : "3 ${languageJumbotron["minute-ago"]}",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          _getStatusUI(conversation.to.status)
        ],
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(conversation.to.imageURL),
        ));
  }
}
