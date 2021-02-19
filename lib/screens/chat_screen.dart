import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/common/ReusableSearchBar.dart';
import 'package:flutter_chat_v2/components/conversation/ConversationItem.dart';
import 'package:flutter_chat_v2/components/conversation/ConversationItemGroup.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/screens/conversation_screen.dart';
import 'package:flutter_chat_v2/screens/setting_screen.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;

    Widget _getFlexibleSpaceArea() {
      return FlexibleSpaceBar(
        centerTitle: true,
        background: SafeArea(
            child: Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Container(
                    margin: EdgeInsets.only(top: 60, right: 20, left: 20),
                    child: ReusableSearchBar(onChangeEvent: (value) {
                      print(value);
                    }, placeholder: languageJumbotron["search-button-placeholder"])))),
      );
    }

    Widget _getSliverAppBar() {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) => SettingScreen()));
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
          actions: [
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  size: 28,
                ),
                onPressed: () => {})
          ],
          flexibleSpace: _getFlexibleSpaceArea());
    }

    List<Conversation> conversationByCurrentUser =
        UserMockData().currentUser.getConversation;
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        _getSliverAppBar(),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          Conversation currentConversation = conversationByCurrentUser[index];
          Widget conversationComponent;
          if (currentConversation.getParticipantsExceptCurrentUser.length <= 1) {
            conversationComponent = ConversationItem(
              conversation: currentConversation.getFilterConversation,
            );
          } else {
            conversationComponent = ConversationItemGroup(
              conversation: currentConversation
            );
          }
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConversationScreen(
                            conversation:
                                currentConversation.getFilterConversation,
                          ))),
              child: conversationComponent);
        }, childCount: conversationByCurrentUser.length))
      ],
    );
  }
}
