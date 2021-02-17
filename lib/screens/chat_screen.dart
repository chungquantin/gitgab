import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/ConversationItem.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/screens/conversation_screen.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
      Language.of(context).currentLanguagePack.jumbotron;

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
                            hintText: languageJumbotron["search-button-placeholder"],
                            hintStyle: TextStyle(color: Colors.grey))),
                  ),
                ],
              ),
            ),
          )),
        );

      Widget _getSliverAppBar(){
        return SliverAppBar(
            floating: true,
            title: Text(
              titleCase(languageJumbotron["chat-screen-header"]),
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
            flexibleSpace: _getFlexibleSpaceArea());
      }

    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        _getSliverAppBar(),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          Conversation currentConversation =
              ConversationMockData().getConversations[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConversationScreen(
                            conversation: currentConversation,
                          ))),
              child: ConversationItem(
                conversation: currentConversation,
              ));
        }, childCount: ConversationMockData().getConversations.length))
      ],
    );
  }
}
