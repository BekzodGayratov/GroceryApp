import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project/constants/themeMode/light_theme_colors.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:project/providers/hide_password_provider.dart';
import 'package:project/services/fireBase_phone_auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _phoneNumber;
  PhoneNumber number = PhoneNumber(isoCode: "UZ");
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
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              _phoneNumber = number.phoneNumber;
                            },
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            initialValue: number,

                          ),
                          TextFormField(
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
                                    borderRadius: BorderRadius.circular(30.0)),
                                suffixIcon: IconButton(
                                  icon: SvgPicture.asset("assets/eye.svg"),
                                  onPressed: () {
                                    context
                                        .read<HidePasswordProvider>()
                                        .hidePassword();
                                  },
                                )),
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
                                _phoneNumber.toString());
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
