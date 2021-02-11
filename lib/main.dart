import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/IconWithBadge.dart';
import 'package:flutter_chat_v2/screens/home_screen.dart';
import 'package:flutter_chat_v2/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AppTheme(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(AppTheme.of(context, listen: true).currentThemeKey);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chap V2',
      home: MyHomePage(),
      theme: AppTheme.of(context, listen: true).currentTheme,
    );
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
      appBar: AppBar(
        title: Text("Hello World"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: this.getBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BottomNavigationBar(
            elevation: 3.0,
            selectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: __selectedIndex,
            items: this.getNavigationBarItems(),
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

  List<BottomNavigationBarItem> getNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: IconWithBadge(
          icon: CupertinoIcons.chat_bubble_2_fill,
          badge: "",
        ),
        // ignore: deprecated_member_use
        title: Text("Chat"),
      ),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.group,
            badge: "1",
          ),
          // ignore: deprecated_member_use
          title: Text("Groups")),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.share,
            badge: "",
          ),
          // ignore: deprecated_member_use
          title: Text("Social")),
      BottomNavigationBarItem(
          icon: IconWithBadge(
            icon: Icons.extension_rounded,
            badge: "",
          ),
          // ignore: deprecated_member_use
          title: Text("Extension"))
    ];
  }

  Widget getBody() {
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
