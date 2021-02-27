import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String userId;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = (prefs.getString("userId") ?? "");
    if (userId.isEmpty) {
      Navigator.pushNamedAndRemoveUntil(
          context, "/login", ModalRoute.withName("/login"));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, "/", ModalRoute.withName("/"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
