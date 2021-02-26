import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/app.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppTheme(),
        ),
        ChangeNotifierProvider(
          create: (_) => Language(),
        ),
      ],
      child: MyApp(),
    ),
  ));
}


// AppTheme.of(context, listen: true).currentTheme
