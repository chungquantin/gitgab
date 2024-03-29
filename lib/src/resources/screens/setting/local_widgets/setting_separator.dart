import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/src/resources/theme/themes.dart';

class SettingSeparator extends StatelessWidget {
  const SettingSeparator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child:  Container(
            decoration: BoxDecoration(
                color: AppTheme.of(context).currentThemeKey == AppThemeKeys.dark
                    ? Colors.grey[800].withOpacity(0.4)
                    : Colors.grey[300]),
          ),
        ),
    );
  }
}