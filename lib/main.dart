import 'package:flutter/material.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:project/routes/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeThemeModeProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _myRouter = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/enterance',
      onGenerateRoute: _myRouter.onGenerate,
    );
  }
}
