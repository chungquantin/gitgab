import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';

class ReusableSearchBar extends StatelessWidget {
  final Function onChangeEvent;
  final String placeholder;
  const ReusableSearchBar({Key key, @required this.onChangeEvent, @required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
            iconSize: 25,
          ),
          Expanded(
            child: TextField(
                textInputAction: TextInputAction.search,
                onChanged: this.onChangeEvent,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration.collapsed(
                    hintText: this.placeholder,
                    hintStyle: TextStyle(color: Colors.grey))),
          ),
        ],
      ),
    );
  }
}
