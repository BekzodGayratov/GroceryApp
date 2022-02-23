import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view/pages/sign_in_page.dart';
import 'package:project/view/screens/home_page.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  _EnterancePageState createState() => _EnterancePageState();
}
class _EnterancePageState extends State<EnterancePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
          (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/Logo.svg',
          height: MediaQuery.of(context).size.height * 0.25,
          width: 135.0,
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}
