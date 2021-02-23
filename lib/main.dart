import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/app.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';
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
