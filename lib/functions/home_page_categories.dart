import 'package:flutter/material.dart';
import 'package:project/services/fireStore_readData_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/providers/change_theme_provider.dart';

SizedBox categories(BuildContext context, {required bool b}) {
  if (b) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.175,
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
                  color: Color(
                      int.parse(FireStoreReadDataService.category![index]["color"])),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                        FireStoreReadDataService.category![index]["imageUrl"],height: MediaQuery.of(context).size.height * 0.08,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      FireStoreReadDataService.category![index]["name"],
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
          itemCount: FireStoreReadDataService.category!.length),
    );
  } else {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.022),
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.48,
            decoration: BoxDecoration(
                color: Color(int.parse(FireStoreReadDataService.bestSelling![index]["backColor"])), borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.network(
                  FireStoreReadDataService.bestSelling![index]['imageUrl'],height: MediaQuery.of(context).size.height *0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                        bottom: MediaQuery.of(context).size.height * 0.007),
                    child: Text(
                   FireStoreReadDataService.bestSelling![index]["name"],
                      style: TextStyle(fontWeight: FontWeight.w700,color: context.watch<ChangeThemeProvider>().primaryTextColor),
                    ),
                  ),
                  Text(
                    FireStoreReadDataService.bestSelling![index]["subtitle"],
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
                        FireStoreReadDataService.bestSelling![index]['kg'].toString()+"/Kg",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w700,color: context.watch<ChangeThemeProvider>().primaryTextColor),
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
        itemCount: FireStoreReadDataService.bestSelling!.length,
      ),
    );
  }
}
