import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';

class ConversationScreen extends StatefulWidget {
  final Conversation conversation;
  ConversationScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: EdgeInsets.only(top: 5),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.conversation.to.imageURL),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.conversation.to.name),
                        Row(
                          children: [
                            Text(
                              languageJumbotron["status-online"],
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2, left: 3),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2)),
                              child: Text(
                                "12",
                                style:
                                    TextStyle(color: Colors.green, fontSize: 7),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              centerTitle: false,
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
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ),
              actions: [
                IconButton(icon: Icon(Icons.call), onPressed: () {}),
                IconButton(
                  icon: Icon(CupertinoIcons.video_camera_solid),
                  onPressed: () {},
                  iconSize: 32,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
