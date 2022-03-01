import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/functions/home_page_categories.dart';
import 'package:project/services/fireStore.services.dart';
import 'package:project/widgets/homeScreen/search_field.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/change_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final _firestore = FirebaseFirestore.instance;
  int _coupons = 3;

  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
              future: FireStoreService.readValue(collection: "grocery"),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      children: [
                        categories(context, b: true),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              right: MediaQuery.of(context).size.width * 0.028,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
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
                        categories(context, b: false)
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  }
