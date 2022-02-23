import 'package:flutter/widgets.dart';
import 'package:project/constants/themeMode/dark_theme_colors.dart';
import 'package:project/constants/themeMode/light_theme_colors.dart';

class ChangeThemeProvider extends ChangeNotifier {
  var yes = true;

  String themeSvgPic = LightThemeColors.svgPic;
  Color scaffoldColor = LightThemeColors.scaffoldsColor;
  Color primaryTextColor = LightThemeColors.primaryTextsColor;
  Color secondaryTextColor = LightThemeColors.secondaryTextsColor;
  Color loginPageOutlineButtonColor =
      LightThemeColors.loginPageOutlineButtonColor;

  void changeTheme() {
    if (yes == true) {
      themeSvgPic = DarkThemeColors.svgPic;
      scaffoldColor = DarkThemeColors.scaffoldsColor;
      primaryTextColor = DarkThemeColors.primaryTextsColor;
      secondaryTextColor = DarkThemeColors.secondaryTextsColor;
      loginPageOutlineButtonColor = DarkThemeColors.loginPageOutlineButtonColor;
      yes = !yes;
      notifyListeners();
    } else {
      themeSvgPic = LightThemeColors.svgPic;
      scaffoldColor = LightThemeColors.scaffoldsColor;
      primaryTextColor = LightThemeColors.primaryTextsColor;
      secondaryTextColor = LightThemeColors.secondaryTextsColor;
      loginPageOutlineButtonColor =
          LightThemeColors.loginPageOutlineButtonColor;
      yes = !yes;
      notifyListeners();
    }
  }
}
