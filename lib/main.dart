import 'package:flutter/material.dart';
import 'package:project/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
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
