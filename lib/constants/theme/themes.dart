import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

enum AppThemeKeys { light, dark }

final Map<AppThemeKeys, ThemeData> _themes = {
  AppThemeKeys.dark: ThemeData(
      primaryColor: HexColor("#121212"),
      accentColor: Colors.deepPurple,
      secondaryHeaderColor: HexColor("#1D1D1D"),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor("#1D1D1D"),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[700]),
      textTheme: TextTheme(
        headline3: TextStyle(color: Colors.grey[100], fontSize: 17),
        bodyText1: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
      )),
  AppThemeKeys.light: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.deepPurple,
      secondaryHeaderColor: Colors.grey[100],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey[500]),
      textTheme: TextTheme(
        headline3: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 17),
        bodyText1: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
      )),
};

class AppTheme extends ChangeNotifier {
  // Method này sẽ giúp chúng ta lấy AppTheme ra một cách dễ dàng hơn, thay vì
  // Provider.of<AppTheme>(context)
  // chúng ta chỉ cần
  // AppTheme.of(context)
  static AppTheme of(BuildContext context, {bool listen = false}) =>
      Provider.of<AppTheme>(context, listen: listen);

  // Đây sẽ là state chính của class, chứa tên của theme, mặc định mình set là light
  AppThemeKeys _themeKey = AppThemeKeys.dark;

  // Mình tạo thêm 2 cái getter này để dễ sử dụng hơn
  // currentTheme sẽ là theme hiện tại (là ThemeData không phải tên theme nữa)
  // currentThemeKey là tên theme hiện tại (mình không public _themeKey bởi vì
  // mình không muốn chỉnh sửa trực tiếp vào biến mà qua các setter vì còn cần notifyListeners() nữa)
  ThemeData get currentTheme => _themes[_themeKey];
  AppThemeKeys get currentThemeKey => _themeKey;

  ThemeData getTheme(AppThemeKeys key) {
    return _themes[key];
  }

  // Đổi theme sang một theme khác
  void setTheme(AppThemeKeys themeKey) {
    _themeKey = themeKey;
    notifyListeners();
  }

  // Ở đây mình chỉ có 2 theme nên mình sẽ tạo thêm 1 method để demo dễ hơn. Method này sẽ switch giữa
  // light theme và dark theme
  void switchTheme() {
    if (_themeKey == AppThemeKeys.dark) {
      _themeKey = AppThemeKeys.light;
    } else {
      _themeKey = AppThemeKeys.dark;
    }
    notifyListeners();
  }
}
