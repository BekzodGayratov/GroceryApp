import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/providers/change_theme_provider.dart';
import 'package:project/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeScreen()];
    return ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: screens[0],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              elevation:50.0,
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
          ),
        );
      },
    );
  }
}
