import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/src/resources/screens/setting/local_widgets/setting_item.dart';
import 'package:flutter_chat_v2/src/resources/screens/setting/local_widgets/setting_separator.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';
import 'package:flutter_chat_v2/src/utils/stringFormatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = AppTheme.of(context).currentThemeKey == AppThemeKeys.dark;
    LanguagePack _lang = Language.of(context, listen: true).currentLanguagePack;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(titleCase(_lang.jumbotron["setting-screen-header"])),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)
              ),
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
              SettingItem(
                  onTapEvent: () =>
                      Navigator.pushNamed(context, "/setting/language"),
                  leftChildren: [
                    FaIcon(FontAwesomeIcons.language, size: 17),
                    SizedBox(width: 15),
                    Text(
                      _lang.jumbotron["language-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                  rightChildren: [
                    Text(
                      _lang.language["language-${_lang.runtimeType.toString()}"],
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
                  _lang.jumbotron["dark-mode-setting"],
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
                  activeTrackColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                  activeColor: Theme.of(context).accentColor,
                  inactiveTrackColor: Colors.grey,
                ),
              ]),
              SettingSeparator(),
              SettingItem(
                  onTapEvent: () => Navigator.pushNamed(context, "/setting/theme"),
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
                      _lang.jumbotron["theme-setting"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                  rightChildren: [])
            ],
          ),
        ));
  }
}
