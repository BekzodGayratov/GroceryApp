import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        unselectedItemColor: Color(0xFF696974),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigation/home.svg"),label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigation/search.svg"),label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigation/cart.svg"),label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/bottomNavigation/profile.svg"),label: "Home"),
        ],
      ),
    );
  }
}