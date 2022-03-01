import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _myRouter = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nano"),
      initialRoute: '/enterance',
      onGenerateRoute: _myRouter.onGenerate,
    );
  }
}
