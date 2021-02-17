import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/common/IconWithBadge.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/screens/chat_screen.dart';
import 'package:flutter_chat_v2/constants/theme/themes.dart';
import 'package:hexcolor/hexcolor.dart';
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

// AppTheme.of(context, listen: true).currentTheme
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chap V2',
        home: MyHomePage(),
        theme: ThemeData(
            primaryColor: HexColor("#121212"),
            accentColor: Colors.deepPurple,
            secondaryHeaderColor: HexColor("#1D1D1D"),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor("#1D1D1D"),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[700]),
            textTheme: TextTheme(
              headline3: TextStyle(color: Colors.grey[100], fontSize: 17),
              bodyText1: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            )));
  }
}

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
      body: SafeArea(child: this._getBody()),
      floatingActionButton: this._getFloatingButton(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BottomNavigationBar(
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
        ),
      ),
    );
  }

  dynamic _getFloatingButton() {
    switch (this.__selectedIndex) {
      case 0:
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(CupertinoIcons.create),
        );
      case 1:
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.group_add),
        );
      default:
        break;
    }
  }

  List<BottomNavigationBarItem> _getNavigationBarItems() {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
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
        return Text("Screen 1");
      default:
        return Container();
    }
  }
}
