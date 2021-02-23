import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/screens/home/local_widgets/home_navigation_bar_items.dart';
import 'package:flutter_chat_v2/src/resources/screens/home/local_widgets/home_body.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        children: [
          HomeBody(index: __selectedIndex),
          buildBottomNavigationBar(context)
        ],
      )),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    BottomNavigationBarThemeData _theme =
        Theme.of(context).bottomNavigationBarTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor: _theme.selectedItemColor,
        unselectedItemColor: _theme.unselectedItemColor,
        backgroundColor: _theme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: __selectedIndex,
        items: HomeNavigationBarItems(context),
        onTap: (int index) {
          setState(() {
            __selectedIndex = index;
          });
        },
      ),
    );
  }
}
