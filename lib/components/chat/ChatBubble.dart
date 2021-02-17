import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble({Key key}) : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(UserMockData().currentUser.imageURL),
              radius: 23,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: EdgeInsets.only(top: 15, right: 80),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(20))),
              child: Text(
                "Natus sunt qui repudiandae quae minima voluptas. Deleniti excepturi quia. Quisquam harum eos ut ab rerum in nihil vitae laborum. Et praesentium dolores impedit distinctio perspiciatis eius quas.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
