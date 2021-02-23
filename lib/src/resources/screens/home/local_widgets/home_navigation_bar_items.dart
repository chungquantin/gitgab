import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/src/resources/widgets/icon_w_badge.dart';

// ignore: non_constant_identifier_names
List<BottomNavigationBarItem> HomeNavigationBarItems(BuildContext context) {
  dynamic languageJumbotron =
      Language.of(context, listen: true).currentLanguagePack.jumbotron;
  return [
    BottomNavigationBarItem(
      icon: IconWithBadge(
        icon: CupertinoIcons.chat_bubble_2_fill,
        badge: UserMockData().currentUser.hasUnreadConversation
            ? "${UserMockData().currentUser.countTotalUnreadMessage}"
            : "",
      ),
      // ignore: deprecated_member_use
      title: Text(languageJumbotron["chat-bottom-header"]),
    ),
    BottomNavigationBarItem(
        icon: IconWithBadge(
          icon: Icons.group,
          badge: "",
        ),
        // ignore: deprecated_member_use
        title: Text(languageJumbotron["groups-bottom-header"])),
    BottomNavigationBarItem(
        icon: IconWithBadge(
          icon: Icons.share,
          badge: "",
        ),
        // ignore: deprecated_member_use
        title: Text(languageJumbotron["social-bottom-header"])),
    BottomNavigationBarItem(
        icon: IconWithBadge(
          icon: Icons.extension_rounded,
          badge: "",
        ),
        // ignore: deprecated_member_use
        title: Text(languageJumbotron["extension-bottom-header"]))
  ];
}
