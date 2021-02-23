import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Back",
        icon: UserMockData().currentUser.hasUnreadConversation
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    UserMockData()
                        .currentUser
                        .countTotalUnreadMessage
                        .toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context));
  }
}
