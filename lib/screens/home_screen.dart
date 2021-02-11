import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _getFlexibleSpaceArea() => FlexibleSpaceBar(
          centerTitle: true,
          background: SafeArea(
              child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
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
                        onChanged: (String value) {
                          print("value");
                        },
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration.collapsed(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey))),
                  ),
                ],
              ),
            ),
          )),
        );
      
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
            floating: true,
            title: Text("Chats"),
            centerTitle: true,
            pinned: true,
            expandedHeight: 130,
            elevation: 0.0,
            leading: CircleAvatar(
              backgroundImage: AssetImage(""),
            ),
            flexibleSpace: _getFlexibleSpaceArea()),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Text("Hello World"),
            height: 300,
          );
        }, childCount: 5))
      ],
    );
  }
}
