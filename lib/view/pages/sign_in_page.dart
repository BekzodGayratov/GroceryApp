import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/components/global_numbers.dart';
import 'package:project/constants/themeMode/light_theme_colors.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:project/providers/hide_password_provider.dart';
import 'package:project/services/fireBase_phone_auth_service.dart';
import 'package:project/view/screens/home_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _valueDrop = "+1";
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeThemeProvider()),
        ChangeNotifierProvider(create: (context) => HidePasswordProvider()),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: context.watch<ChangeThemeProvider>().scaffoldColor,
          body: SingleChildScrollView(
            child: FadeInUp(
              child: Padding(
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
                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _phoneController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.03),
                                  hintText: "Your Phone Number",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  prefixIcon: SizedBox(
                                    width: 100,
                                    height: 20,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              iconSize: 0.0,
                                              value: _valueDrop,
                                              items: List.generate(names.length,
                                                  (index) {
                                                return DropdownMenuItem(
                                                    value: names[index],
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                Colors.red),
                                                        Text(names[index])
                                                      ],
                                                    ));
                                              }),
                                              onChanged: (v) {
                                                setState(() {
                                                  _valueDrop = v.toString();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.057,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0035,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: TextFormField(
                              obscureText:
                                  context.watch<HidePasswordProvider>().hide,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02),
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  suffixIcon: IconButton(
                                    icon: SvgPicture.asset("assets/eye.svg"),
                                    onPressed: () {
                                      context
                                          .read<HidePasswordProvider>()
                                          .hidePassword();
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.62),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: context
                                .watch<ChangeThemeProvider>()
                                .elevatedButtonsColor),
                        child: const Text("Forget Password"),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: context
                                  .watch<ChangeThemeProvider>()
                                  .elevatedButtonsColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0))),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .elevatedButtonsTextsColor),
                          ),
                          onPressed: () {
                            LoginWithPhone.loginWithPhone(
                                _phoneController.text);
                            setState(() {});
                            Navigator.pushNamed(context, '/verifyCode');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
