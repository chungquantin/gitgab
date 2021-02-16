import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/ConversationItem.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';

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
              margin: EdgeInsets.only(top: 60, right: 20, left: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
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
            title: Text(
              "Chats",
              style: TextStyle(fontSize: 21),
            ),
            centerTitle: true,
            pinned: true,
            expandedHeight: 120,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                print("Current Avatar tapped!");
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 13, bottom: 10),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(UserMockData().currentUser.imageURL),
                ),
              ),
            ),
            actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
            flexibleSpace: _getFlexibleSpaceArea()),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          Conversation currentConversation = ConversationMockData().getConversations[index];
          return InkWell(
              onTap: () {
                print('Item clicked!');
              },
              child: ConversationItem(
                conversation: currentConversation,
              ));
        }, childCount: ConversationMockData().getConversations.length))
      ],
    );
  }
}
