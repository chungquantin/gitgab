import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final List<Widget> leftChildren;
  final List<Widget> rightChildren;
  final Function onTapEvent;
  const SettingItem(
      {Key key,
      @required this.leftChildren,
      @required this.rightChildren,
      @optionalTypeArgs this.onTapEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTapEvent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration:
            BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [...leftChildren, Spacer(), ...rightChildren],
        ),
      ),
    );
  }
}