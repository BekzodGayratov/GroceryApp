import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:project/view/pages/sign_in_page.dart';
import 'package:project/view/screens/home_page.dart';
import 'package:provider/provider.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  _EnterancePageState createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  _authUser.currentUser != null ? HomePage() : SignInPage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ChangeThemeProvider()),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: context.watch<ChangeThemeProvider>().scaffoldColor,
          body: Center(
            child: SvgPicture.asset(
              'assets/Logo.svg',
              height: MediaQuery.of(context).size.height * 0.25,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        );
      },
    );
  }
}
