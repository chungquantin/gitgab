import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

enum AppThemeKeys { light, dark }

final Map<AppThemeKeys, ThemeData> _themes = {
  AppThemeKeys.dark: ThemeData(
      primaryColor: HexColor("#161b22"),
      accentColor: Colors.green,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[700]),
      textTheme: TextTheme()),
  AppThemeKeys.light: ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.grey,
  ),
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
