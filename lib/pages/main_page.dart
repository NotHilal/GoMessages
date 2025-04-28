import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_application/components/bottom_navigation_item.dart';
import 'package:flutter_test_application/config/app_icons.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:flutter_test_application/model/user.dart';
import 'package:flutter_test_application/pages/home_page.dart';
import 'package:flutter_test_application/pages/profile_page.dart';
import 'package:flutter_test_application/styles/app_colors.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages()[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(currentIndex: currentIndex, onTap:(value) {
        setState(() {
          currentIndex=value;
          
        });
      }),
    );
  }

  pages() => [
    HomePage(),
    Center(child: Text("Favorite")),
    Center(child: Text("Add Post")),
    Center(child: Text("Message")),
    ProfilePage(user: widget.user),
  ];
}

enum Menus{
  home,
  favorite,
  add,
  messages,
  user

}

class MyBottomNavigation extends StatelessWidget{
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;

const MyBottomNavigation({super.key, required this.currentIndex, required this.onTap});

 @override
  Widget build(BuildContext context){
    return Container(
      height: 87,
      margin : EdgeInsets.all(24),

      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container( 
              height: 70,
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)
              ),
              ),
              child: Row(
                children: [
                  Expanded(child: 
                  BottomNavigationItem(onPressed: () =>{onTap(Menus.home)}, icon: AppIcons.home, current: currentIndex, name: Menus.home),
                  ),
                  Expanded(child: 
                  BottomNavigationItem(onPressed: () =>{onTap(Menus.favorite)}, icon: AppIcons.heart, current: currentIndex, name: Menus.favorite),
                  ),
                  Spacer(),
                  Expanded(child: 
                  BottomNavigationItem(onPressed: () =>{onTap(Menus.messages)}, icon: AppIcons.chat, current: currentIndex, name: Menus.messages),
                  ),
                  Expanded(child: 
                  BottomNavigationItem(onPressed: () =>{onTap(Menus.user)}, icon: AppIcons.user, current: currentIndex, name: Menus.user),
                  ),

                ],
              ),
              ),
          ),
            Positioned(
              left: 0, right: 0,
              top: 0,
              child: GestureDetector(
                onTap: ()=> onTap(Menus.add),
                child: Container(
                  width: 64,
                  height: 64,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape:  BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppIcons.plus),
                  ),
              ),
            )
            ],
      
      
      ),
    );
    

  }
  
}


