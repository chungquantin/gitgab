import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_v2/src/core/config/client.dart';
import 'package:flutter_chat_v2/src/resources/landing/landing.dart';
import 'package:flutter_chat_v2/src/resources/screens/auth/login.dart';
import 'package:flutter_chat_v2/src/resources/screens/auth/signup.dart';
import 'package:flutter_chat_v2/src/resources/screens/home/home.dart';
import 'package:flutter_chat_v2/src/resources/screens/language/language.dart';
import 'package:flutter_chat_v2/src/resources/screens/setting/setting.dart';
import 'package:flutter_chat_v2/src/resources/screens/theme/theme.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Avoid Screen Rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GraphQLProvider(
      client: GraphQLConfig.client,
      child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'GitGab',
          initialRoute: "/landing",
          routes: {
            "/": (_) => HomeScreen(),
            "/landing": (_) => LandingScreen(),
            "/login": (_) => LoginScreen(),
            "/signup": (_) => SignupScreen(),
            "/setting": (_) => SettingScreen(),
            "/setting/language": (_) => LanguageScreen(),
            "/setting/theme": (_) => ThemeSettingScreen(),
          },
          theme: AppTheme.of(context, listen: true).currentTheme),
    );
  }
}
