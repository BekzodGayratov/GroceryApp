import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/constants/themeMode/light_theme_colors.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldsColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: SvgPicture.asset(
              "assets/welcome.svg",
              allowDrawingOutsideViewBox: true,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.watch<ChangeThemeModeProvider>().lightMode =
            !context.watch<ChangeThemeModeProvider>().lightMode;
        context.read<ChangeThemeModeProvider>().changeTheme();
      }),
    );
  }
}
