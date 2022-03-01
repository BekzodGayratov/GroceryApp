import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/services/fireStore.services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/providers/change_theme_provider.dart';

SizedBox categories(BuildContext context, {required bool b}) {
  List category = (FireStoreService.data!.get("category") as List);
  if (b) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.022),
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Color(int.parse(category[index]['color'])),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                       category[index]["imageUrl"]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      category[index]["name"],
                      style: TextStyle(
                          color: context
                              .watch<ChangeThemeProvider>()
                              .primaryTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: category.length),
    );
  } else {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.022),
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.network(
                      "https://firebasestorage.googleapis.com/v0/b/grocery-app-773a8.appspot.com/o/banana.svg?alt=media&token=e8b49459-fdbc-4b6c-8d44-40d0d4a44623"),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                        bottom: MediaQuery.of(context).size.height * 0.007),
                    child: Text(
                      "Best Selling",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Vegshop",
                    style: TextStyle(
                        color: context
                            .watch<ChangeThemeProvider>()
                            .secondaryTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$4.99/Kg",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.09,
                        child: ElevatedButton(
                          child: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff2ECC71),
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width *
                                      0.005),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
