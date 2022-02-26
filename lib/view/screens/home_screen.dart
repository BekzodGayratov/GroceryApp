import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/widgets/homeScreen/search_field.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/change_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _coupons = 3;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
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
                      child: SearchFieldHomeScreen(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.015),
                        leading: SvgPicture.asset(
                            "assets/homePageComponents/coupon.svg"),
                        title: Text(
                          "You have $_coupons coupon",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text("Let's use this coupon"),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Choose Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .primaryTextColor),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .secondaryTextColor),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  categories(context, boxHeight: 0.16, contWidth: 0.3),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04,
                        right: MediaQuery.of(context).size.width * 0.028,
                        bottom: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .primaryTextColor),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: context
                                    .watch<ChangeThemeProvider>()
                                    .secondaryTextColor),
                          ),
                        ]),
                  ),
                  categories(context, boxHeight: 0.3, contWidth: 0.47)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox categories(BuildContext context,
      {required double boxHeight, required double contWidth}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * boxHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.022),
            height: double.infinity,
            width: MediaQuery.of(context).size.width * contWidth,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                //SvgPicture.network(""),
                Text("Vegetables"),
              ],
            ),
          );
        },
      ),
    );
  }
}
