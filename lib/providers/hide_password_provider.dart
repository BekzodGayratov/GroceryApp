import 'package:flutter/widgets.dart';

class HidePasswordProvider extends ChangeNotifier {
  bool hide = false;
  void hidePassword() {
    hide = !hide;
    notifyListeners();
  }
}
