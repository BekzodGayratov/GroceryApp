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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025),
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                           color: Colors.blue,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Column(
                          children: [
                            SvgPicture.network(""),
                            Text("Vegetables"),
                          ],
                        ),
                      );
                    },  
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
