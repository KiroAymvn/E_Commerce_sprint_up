import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/custom%20widgets/custom_text.dart';
import 'package:ecommercefinalproj/screens/cart_screen.dart';
import 'package:ecommercefinalproj/screens/favorite_screen.dart';
import 'package:ecommercefinalproj/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeScreen(), FavoriteScreen(), CartScreen()];
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,

        items: <Widget>[
          Icon(Icons.home_filled, color: AppColor.white, size: 30),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: AppColor.white),
        ],

        color: AppColor.black,
        buttonBackgroundColor: AppColor.darkGrey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 500),

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        // letIndexChange: (index) => true,
      ),
    );
  }
}
