import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/setting/SettingItem.dart';
import 'package:flutter_chat_v2/components/setting/SettingSeparator.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/constants/theme/themes.dart';
import 'package:flutter_chat_v2/screens/LanguageScreen.dart';
import 'package:flutter_chat_v2/screens/ThemeSettingScreen.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = AppTheme().currentThemeKey == AppThemeKeys.dark;

  @override
  Widget build(BuildContext context) {
    Map<String, String> languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;
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
        body: Center(
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
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
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
              Row(children: [
                Text("Github", style: Theme.of(context).textTheme.headline3)
              ]),
              SettingItem(
                  onTapEvent: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LanguageScreen())),
                  leftChildren: [
                    FaIcon(FontAwesomeIcons.language, size: 17),
                    SizedBox(width: 15),
                    Text(
                      languageJumbotron["language-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                  rightChildren: [
                    Text(
                      languageJumbotron[
                          "language-${Language.of(context).currentLanguagePack.runtimeType.toString()}"],
                    )
                  ]),
              SettingSeparator(),
              SettingItem(leftChildren: [
                FaIcon(
                  FontAwesomeIcons.solidMoon,
                  size: 20,
                ),
                SizedBox(width: 15),
                Text(
                  languageJumbotron["dark-mode-setting"],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ], rightChildren: [
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      AppTheme.of(context).switchTheme();
                      print(AppTheme.of(context).currentThemeKey);
                    });
                  },
                  activeTrackColor: Colors.green[400],
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.grey,
                ),
              ]),
              SettingSeparator(),
              SettingItem(
                  onTapEvent: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ThemeSettingScreen())),
                  leftChildren: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor),
                    ),
                    SizedBox(width: 15),
                    Text(
                      languageJumbotron["theme-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                  rightChildren: [])
            ],
          ),
        ));
  }
}


