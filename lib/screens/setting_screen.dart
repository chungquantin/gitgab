import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/constants/theme/themes.dart';
import 'package:flutter_chat_v2/screens/language_screen.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Map<String, String> languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(titleCase(languageJumbotron["setting-screen-header"])),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(UserMockData().currentUser.imageURL),
                  radius: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 45),
                    Text(
                      UserMockData().currentUser.name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).iconTheme.color,
                          size: 20,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageJumbotron["language-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LanguageScreen())),
                      child: Text(languageJumbotron["language-VN"],
                          style: Theme.of(context).textTheme.headline3),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageJumbotron["theme-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          AppTheme.of(context).switchTheme();
                          print(AppTheme.of(context).currentThemeKey);
                        });
                      },
                      activeTrackColor:
                          Theme.of(context).accentColor.withOpacity(0.7),
                      activeColor: Theme.of(context).accentColor,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
