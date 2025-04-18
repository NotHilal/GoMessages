import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_application/config/app_icons.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:flutter_test_application/pages/home_page.dart';
import 'package:flutter_test_application/pages/profile_page.dart';
import 'package:flutter_test_application/styles/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.heart),
            label: AppStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.heart),
            label: AppStrings.add,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.chat),
            label: AppStrings.messages,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.user),
            label: AppStrings.user,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.background,
        backgroundColor: AppColors.primary,
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(child: Text("Favorite")),
    Center(child: Text("Add Post")),
    Center(child: Text("Message")),
    Center(child: ProfilePage()),
  ];
}
