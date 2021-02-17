import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_v2/components/common/UserStatus.dart';

class UserMockData {
  User currentUser = User(
      id: "1",
      name: "Chung Quan Tin",
      status: UserStatus.busy,
      imageURL:
          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80");
  List<User> listOfUsers = [
    User(
        id: "2",
        name: "Linh Phương",
        status: UserStatus.online,
        imageURL:
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    User(
        id: "3",
        name: "Ngọc Quý",
        status: UserStatus.offline,
        imageURL:
            "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    User(
        id: "4",
        name: "Tô Phúc Khang",
        status: UserStatus.none,
        imageURL:
            "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    User(
        id: "5",
        name: "Andiezz",
        status: UserStatus.none,
        imageURL:
            "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    User(
        id: "6",
        name: "Tín Quan Chung",
        status: UserStatus.online,
        imageURL:
            "https://images.unsplash.com/photo-1606159068539-43f36b99d1b2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1341&q=80")
  ];
  List<User> get getMockUsers {
    return this.listOfUsers;
  }

  User get getCurrentUser {
    return this.currentUser;
  }
}

class ConversationMockData {
  List<Conversation> listOfConversation = [
    Conversation(
        from: UserMockData().currentUser,
        to: UserMockData().listOfUsers[0],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[0],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[0],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[0],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().currentUser,
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos.")
        ]),
    Conversation(
        from: UserMockData().currentUser,
        to: UserMockData().listOfUsers[1],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[1],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[1],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().listOfUsers[1],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ])
  ];

  List<Conversation> get getConversations {
    return this.listOfConversation;
  }
}

class Conversation {
  User from;
  User to;
  DateTime createdAt;
  List<Message> messages;

  Conversation(
      {@required this.from,
      @required this.to,
      @required this.createdAt,
      @required this.messages});
}

class Message {
  DateTime dateTime;
  User sender;
  bool unread;
  String text;

  Message(
      {@required this.dateTime,
      @required this.sender,
      @required this.unread,
      @required this.text});
}

class User {
  String id;
  String name;
  UserStatus status;
  Group group;
  String imageURL;

  User({this.name, this.group, this.status, this.imageURL, this.id});
}

class Group {}
