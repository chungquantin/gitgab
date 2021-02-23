import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';
import 'package:flutter_chat_v2/constants/mock/message.dart';
import 'package:flutter_chat_v2/constants/mock/setting.dart';
import 'package:flutter_chat_v2/constants/mock/user.dart';
import 'package:flutter_chat_v2/src/resources/widgets/user_status.dart';
import 'package:flutter_chat_v2/src/theme/themes.dart';

class UserMockData {
  User currentUser = listOfUsers[0];
  static List<User> listOfUsers = [
    User(
        id: "1",
        conversations: [
          "conversation-1",
          "conversation-2",
          "conversation-3",
          "conversation-4",
          "conversation-5",
          "conversation-6",
        ],
        name: "Chung Quan Tin",
        status: UserStatus.busy,
        imageURL:
            "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    User(
        id: "2",
        conversations: ["conversation-1", "conversation-6"],
        name: "Linh Phương",
        status: UserStatus.online,
        imageURL:
            "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    User(
        id: "3",
        conversations: ["conversation-2", "conversation-6"],
        name: "Khả Nhu",
        status: UserStatus.offline,
        imageURL:
            "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    User(
        id: "4",
        conversations: ["conversation-3", "conversation-6"],
        name: "Tô Phúc Khang",
        status: UserStatus.none,
        imageURL:
            "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
    User(
        id: "5",
        conversations: ["conversation-4"],
        name: "Andiezz",
        status: UserStatus.none,
        imageURL:
            "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
    User(
        id: "6",
        conversations: ["conversation-5"],
        name: "Tín Quan Chung",
        status: UserStatus.busy,
        imageURL:
            "https://images.unsplash.com/photo-1606159068539-43f36b99d1b2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1341&q=80")
  ];
  List<User> get getMockUsers {
    return listOfUsers;
  }

  User get getCurrentUser {
    return this.currentUser;
  }

  Setting get currentUserSetting {
    return Setting(language: LanguageEnum.VN, theme: AppThemeKeys.dark);
  }
}

class ConversationMockData {
  List<Conversation> listOfConversation = [
    Conversation(
        id: "conversation-1",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[1]
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[1],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[1],
              unread: false,
              text: "Xin chao, toi la Tin."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().currentUser,
              unread: false,
              text: "Rat vui duoc lam quen voi ban"),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[1],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos.")
        ]),
    Conversation(
        id: "conversation-2",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[2]
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[2],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[2],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[2],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ]),
    Conversation(
        id: "conversation-3",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[3]
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[3],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[3],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[3],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ]),
    Conversation(
        id: "conversation-4",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[4]
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[4],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[4],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[4],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ]),
    Conversation(
        id: "conversation-5",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[5]
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[5],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[5],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[5],
              unread: false,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ]),
    GroupConversation(
        groupName: "Javascript",
        id: "conversation-6",
        participants: [
          UserMockData().currentUser,
          UserMockData().getMockUsers[1],
          UserMockData().getMockUsers[2],
          UserMockData().getMockUsers[3],
        ],
        createdAt: DateTime.now(),
        messages: [
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[2],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[3],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
          Message(
              dateTime: DateTime.now(),
              sender: UserMockData().getMockUsers[1],
              unread: true,
              text:
                  "Sed beatae et quis. Sit maxime libero soluta ea. Et deleniti tenetur ea in. Impedit aut facilis aut voluptatibus corrupti. Qui incidunt est accusantium iusto reprehenderit impedit facere autem. Labore fuga eos."),
        ]),
  ];

  List<Conversation> get getConversations {
    return this.listOfConversation;
  }
}
