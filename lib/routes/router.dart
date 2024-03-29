import 'package:flutter/material.dart';
import 'package:project/view/pages/enterance_page.dart';
import 'package:project/view/pages/sign_in_page.dart';
import 'package:project/view/pages/verify_code_page.dart';
import 'package:project/view/screens/current_screen.dart';

class MyRouter {
  Route? onGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => CurrentScreen());
      case '/enterance':
        return MaterialPageRoute(builder: (context) => EnterancePage());
      case '/signIn':
        return MaterialPageRoute(builder: (context) => SignInPage());
      case '/verifyCode':
        return MaterialPageRoute(builder: (context) => VerifyCodePage());
    }
    return null;
  }
}
