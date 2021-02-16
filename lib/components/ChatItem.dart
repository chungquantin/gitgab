import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/UserStatus.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final String imageURL;
  const ChatItem({Key key, @required this.text, @required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      this.imageURL),
                  radius: 30,
                ),
              ),
              UserStatusComp(status: UserStatus.online,)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    "Chung Quan TIn",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Text(
                    stringFormatter("You: " + this.text, 30),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
