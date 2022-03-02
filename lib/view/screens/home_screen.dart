import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/functions/home_page_categories.dart';
import 'package:project/providers/selected_location_provider.dart';
import 'package:project/services/fireStore_service.dart';
import 'package:project/widgets/homeScreen/search_field.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/change_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStoreService.readValue(collection: "grocery"),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  const CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    "Ma'lumotlar yuklanmoqda...",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: context
                            .watch<ChangeThemeProvider>()
                            .primaryTextColor),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: ChangeNotifierProvider(
                create: (context) => SelectedLocationProvider(),
                builder: (context, child) {
                  return Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
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
                                  value: context
                                      .watch<SelectedLocationProvider>()
                                      .selectedLocation
                                      .toString(),
                                  items: List.generate(
                                      FireStoreService.locations!.length,
                                      (index) {
                                    return DropdownMenuItem(
                                        value: FireStoreService
                                            .locations![index]
                                            .toString(),
                                        child: Text(
                                          FireStoreService.locations![index]
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: context
                                                  .watch<ChangeThemeProvider>()
                                                  .primaryTextColor),
                                        ));
                                  }),
                                  onChanged: (v) {
                                    context
                                        .read<SelectedLocationProvider>()
                                        .changeLocation(v.toString());
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.062,
                                child: SearchFieldHomeScreen(),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.015),
                                  leading: SvgPicture.asset(
                                      "assets/homePageComponents/coupon.svg"),
                                  title: Text(
                                    "You have ${FireStoreService.coupons} coupon",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: context
                                            .watch<ChangeThemeProvider>()
                                            .primaryTextColor),
                                  ),
                                  subtitle: Text(
                                    "Let's use this coupon",
                                    style: TextStyle(
                                        color: context
                                            .watch<ChangeThemeProvider>()
                                            .secondaryTextColor),
                                  ),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            categories(context, b: true),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.028,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
