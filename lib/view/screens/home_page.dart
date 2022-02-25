import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: const Center(child: Text("SALOM")),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            backgroundColor:
                context.watch<ChangeThemeProvider>().bottomNavigationBarColor,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/bottomNavigation/home.svg"),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/bottomNavigation/search.svg"),
                  label: "Explore"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/bottomNavigation/cart.svg"),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/bottomNavigation/profile.svg"),
                  label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
