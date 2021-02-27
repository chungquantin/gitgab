import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/resources/screens/auth/local_widgets/text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, String> languageAuth =
        Language.of(context, listen: true).currentLanguagePack.auth;

    Widget buildHeading() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(languageAuth["login-header"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            SizedBox(
              height: 10,
            ),
            Text(languageAuth["login-title"],
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 23)),
          ],
        ),
      );
    }

    Widget buildForm() {
      return Container(
        child: Column(
          children: [
            AuthScreenTextField(
                hintText: languageAuth["login-email"],
                onChangeEvent: (value) {
                  print(value);
                }),
            SizedBox(
              height: 15,
            ),
            AuthScreenTextField(
                hintText: languageAuth["login-password"],
                onChangeEvent: (value) {
                  print(value);
                })
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.globe),
              onPressed: () =>
                  Navigator.pushNamed(context, "/setting/language"))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 50, 35 ,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeading(),
              SizedBox(
                height: size.height / 15,
              ),
              buildForm()
            ],
          ),
        ),
      ),
    );
  }
}
