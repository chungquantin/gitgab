import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/components/common/IconWithBadge.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/resources/screens/ChatScreen.dart';
import 'package:flutter_chat_v2/src/theme/themes.dart';
import 'package:flutter_chat_v2/src/resources/screens/LanguageScreen.dart';
import 'package:flutter_chat_v2/src/resources/screens/OrganizationScreen.dart';
import 'package:flutter_chat_v2/src/resources/screens/SettingScreen.dart';
import 'package:flutter_chat_v2/src/resources/screens/ThemeSettingScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppTheme(),
      ),
      ChangeNotifierProvider(
        create: (_) => Language(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GitGab',
        initialRoute: "/",
        routes: {
          "/": (_) => MyHomePage(),
          "/setting": (_) => SettingScreen(),
          "/setting/language": (_) => LanguageScreen(),
          "/setting/theme": (_) => ThemeSettingScreen()
        },
        theme: AppTheme.of(context, listen: true).currentTheme);
  }
}

// AppTheme.of(context, listen: true).currentTheme

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int __selectedIndex = 0;

  AppTheme _theme;

  @override
  void didChangeDependencies() {
    if (_theme == null) {
      _theme = AppTheme.of(context);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Stack(
        children: [this._getBody(), buildBottomNavigationBar(context)],
      )),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: __selectedIndex,
        items: this._getNavigationBarItems(),
        onTap: (int index) {
          setState(() {
            __selectedIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getNavigationBarItems() {
    dynamic languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;
    return [
      BottomNavigationBarItem(
        icon: IconWithBadge(
          icon: CupertinoIcons.chat_bubble_2_fill,
          badge: "",
        ),
        // ignore: deprecated_member_use
        title: Text(languageJumbotron["chat-bottom-header"]),
      ),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.group,
            badge: "1",
          ),
          // ignore: deprecated_member_use
          title: Text(languageJumbotron["groups-bottom-header"])),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.share,
            badge: "",
          ),
          // ignore: deprecated_member_use
          title: Text(languageJumbotron["social-bottom-header"])),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.extension_rounded,
            badge: "",
          ),
          // ignore: deprecated_member_use
          title: Text(languageJumbotron["extension-bottom-header"]))
    ];
  }

  Widget _getBody() {
    switch (this.__selectedIndex) {
      case 0:
        return ChatScreen();
      case 1:
        return OrganizationScreen();
      case 2:
        return Text("Social");
      case 3:
        return Text("Extension");
      default:
        return Container();
    }
  }
}
