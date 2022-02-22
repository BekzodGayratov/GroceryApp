import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({ Key? key }) : super(key: key);

  @override
  _EnterancePageState createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/Logo.svg',
        height: MediaQuery.of(context).size.height * 0.25,
        width: 135.0,allowDrawingOutsideViewBox: true,),
      ),
    );
  }
}