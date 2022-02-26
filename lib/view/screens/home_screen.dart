import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/change_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Column(
                children: [
                  Text(
                    "Your location",
                    style: TextStyle(
                        color: context
                            .watch<ChangeThemeProvider>()
                            .secondaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: "Bandung, Cimahi",
                      items: [
                        DropdownMenuItem(
                            value: "Bandung, Cimahi",
                            child: Text(
                              "Bandung, Cimahi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                      onChanged: (v) {},
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.017),
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: const Color(0xffF1F1F5),
                          hintText: "Search anything here",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .secondaryTextColor),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7))),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                        "assets/homePageComponents/coupon.svg"),
                    title: const Text(
                      "You have 3 coupon",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Let's use this coupon"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
