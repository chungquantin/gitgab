import 'package:flutter/material.dart';

class AuthScreenTextField extends StatelessWidget {
  final String hintText;
  final Function onChangeEvent;
  const AuthScreenTextField(
      {Key key, @required this.hintText, @required this.onChangeEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextField(
          onChanged: this.onChangeEvent,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration.collapsed(
              hintText: this.hintText,
              hintStyle: TextStyle(color: Colors.grey))),
    );
  }
}
