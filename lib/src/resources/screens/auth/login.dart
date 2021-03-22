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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(
              height: 10,
            ),
            Text(languageAuth["login-title"],
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22)),
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
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeading(),
              SizedBox(
                height: size.height / 15,
              ),
              buildForm(),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor)),
                  ],
                ),
              )),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('Sign In', style: TextStyle(fontSize: 20)),
                  ),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
