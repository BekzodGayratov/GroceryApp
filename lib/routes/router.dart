import 'package:flutter/material.dart';
import 'package:project/view/pages/enterance_page.dart';
import 'package:project/view/screens/home_page.dart';

class MyRouter {
  Route? onGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/enterance':
        return MaterialPageRoute(builder: (context) => EnterancePage());
    }
  }
}
