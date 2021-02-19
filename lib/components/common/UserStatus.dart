import 'package:flutter/material.dart';

enum UserStatus { online, offline, busy, silence, none }

class UserStatusComp extends StatefulWidget {
  final UserStatus status;
  UserStatusComp({Key key, @required this.status}) : super(key: key);

  @override
  _UserStatusCompState createState() => _UserStatusCompState();
}

class _UserStatusCompState extends State<UserStatusComp> {
  @override
  Widget build(BuildContext context) {
    return widget.status != UserStatus.none
        ? Container(
            margin: EdgeInsets.only(left: 45, top: 10),
            decoration: BoxDecoration(
                color: colorByStatus(widget.status),
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            child: Text(
              "12",
              style: TextStyle(color: colorByStatus(widget.status), fontSize: 10),
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 40, top: 10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(0),
              shape: BoxShape.circle,
            ),
            child: Text(
              "12",
              style: TextStyle(color: Colors.white.withAlpha(0), fontSize: 12),
            ),
          );
  }
}

Color colorByStatus(UserStatus status) {
  Color colorByStatus;
  switch (status) {
    case UserStatus.busy:
      colorByStatus = Colors.red[400];
      break;
    case UserStatus.online:
      colorByStatus = Colors.green;
      break;
    case UserStatus.offline:
      colorByStatus = Colors.grey[700];
      break;
    case UserStatus.silence:
      colorByStatus = Colors.deepPurple[200];
      break;
    default:
      break;
  }
  return colorByStatus;
}
