import 'package:flutter/material.dart';

class GroupConversationAvatar extends StatelessWidget {
  final String groupName;
  final double radius;
  const GroupConversationAvatar(
      {Key key, @required this.groupName, @required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      child: Text(groupName.substring(0, 1),
          style: TextStyle(
              color: Theme.of(context).textTheme.headline3.color,
              fontSize: 25)),
    );
  }
}
