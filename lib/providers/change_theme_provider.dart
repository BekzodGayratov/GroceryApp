import 'package:flutter/widgets.dart';
import 'package:project/constants/themeMode/dark_theme_colors.dart';
import 'package:project/constants/themeMode/light_theme_colors.dart';

class ChangeThemeModeProvider extends ChangeNotifier {
  bool lightMode = false;
  changeTheme() {
    if (lightMode == true) {
      LightThemeColors.scaffoldsColor = DarkThemeColors.scaffoldsColor;
      LightThemeColors.loginPageOutlineButtonColor =
          DarkThemeColors.loginPageOutlineButtonColor;
      LightThemeColors.elevatedButtonsColor =
          DarkThemeColors.elevatedButtonsColor;
      LightThemeColors.outlineButtonsColor =
          DarkThemeColors.outlineButtonsColor;
      LightThemeColors.cancelElevatedButtonsColors =
          DarkThemeColors.cancelElevatedButtonsColors;
      LightThemeColors.elevatedButtonTextsColor =
          DarkThemeColors.cancelElevatedButtonsColors;
      LightThemeColors.primaryTextsColor = DarkThemeColors.primaryTextsColor;
      LightThemeColors.secondaryTextsColor =
          DarkThemeColors.secondaryTextsColor;
    } else {}
    notifyListeners();
  }
}
