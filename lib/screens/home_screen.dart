import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/ChatItem.dart';

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
            leading: Container(
              margin: EdgeInsets.only(top: 7, left: 13, bottom: 7),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn1.tuoitre.vn/zoom/600_315/2019/5/8/avatar-publicitystill-h2019-1557284559744252594756-crop-15572850428231644565436.jpg"),
              ),
            ),
            actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
            flexibleSpace: _getFlexibleSpaceArea()),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return InkWell(
              onTap: () {
                print('Item clicked!');
              },
              child: ChatItem(
                text:
                    "Alias ratione et ullam blanditiis et. Maiores iusto ut debitis omnis dolor aut quasi sequi dolores.",
                imageURL:
                    "https://cdn1.tuoitre.vn/zoom/600_315/2019/5/8/avatar-publicitystill-h2019-1557284559744252594756-crop-15572850428231644565436.jpg",
              ));
        }, childCount: 10))
      ],
    );
  }
}
