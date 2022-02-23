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
    return ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: context.watch<ChangeThemeProvider>().scaffoldColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1,
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Center(
                    child: SvgPicture.asset(
                      context.watch<ChangeThemeProvider>().themeSvgPic,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: context
                          .watch<ChangeThemeProvider>()
                          .primaryTextColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    "Welcome to Organico Mobile Apps Please fill in the field below to sign in",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: LightThemeColors.secondaryTextsColor),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ChangeThemeProvider>().changeTheme();
          }),
        );
      },
    );
  }
}
