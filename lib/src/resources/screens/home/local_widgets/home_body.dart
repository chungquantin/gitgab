import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/screens/chat/chat.dart';
import 'package:flutter_chat_v2/src/resources/screens/organization/organization.dart';

@immutable
class HomeBody extends StatelessWidget {
  final int index;
  const HomeBody({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return ChatScreen();
      case 1:
        return OrganizationScreen();
      case 2:
        return Text("Social");
      case 3:
        return Text("Extension");
      default:
        return Container();
    }
  }
}
