import 'package:flutter_chat_v2/constants/mock/data.dart';

bool isCurrentUser(User user) {
  return user.id == UserMockData().currentUser.id;
}
