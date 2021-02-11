import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/IconWithBadge.dart';
import 'package:flutter_chat_v2/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chap V2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: __selectedIndex,
        items: this.getNavigationBarItems(),
        onTap: (int index) {
          setState(() {
            __selectedIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getNavigationBarItems() {
    return [
      BottomNavigationBarItem(
          icon: IconWithBadge(icon: CupertinoIcons.chat_bubble_2_fill, badge: "1",),
          // ignore: deprecated_member_use
          title: Text("Chat")),
      BottomNavigationBarItem(
          icon: IconWithBadge(icon: Icons.group, badge: "",),
          // ignore: deprecated_member_use
          title: Text("Groups")),
      BottomNavigationBarItem(
          icon: Icon(Icons.share),
          // ignore: deprecated_member_use
          title: Text("Social")),
      BottomNavigationBarItem(
          icon: Icon(Icons.extension_sharp),
          // ignore: deprecated_member_use
          title: Text("Extended"))
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
