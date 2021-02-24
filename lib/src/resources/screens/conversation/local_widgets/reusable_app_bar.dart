import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/screens/conversation/local_widgets/conversation_app_bar_leading.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onTapEvent;
  final String title;
  final Widget avatar;
  final List<Widget> subWidget;
  const ReusableAppBar(
      {Key key,
      @required this.avatar,
      @required this.onTapEvent,
      @required this.title,
      @required this.subWidget})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(margin: EdgeInsets.only(right: 15), child: this.avatar),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.title),
                Row(
                  children: this.subWidget,
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
