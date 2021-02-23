

import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/screens/home/home.dart';
import 'package:flutter_chat_v2/src/resources/screens/language/language.dart';
import 'package:flutter_chat_v2/src/resources/screens/setting/setting.dart';
import 'package:flutter_chat_v2/src/resources/screens/theme/theme.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GitGab',
        initialRoute: "/",
        routes: {
          "/": (_) => HomeScreen(),
          "/setting": (_) => SettingScreen(),
          "/setting/language": (_) => LanguageScreen(),
          "/setting/theme": (_) => ThemeSettingScreen(),
        },
        theme: AppTheme.of(context, listen: true).currentTheme);
  }
}
