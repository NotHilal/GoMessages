import 'package:flutter_test_application/pages/edit_profile_page.dart';
import 'package:flutter_test_application/pages/home_page.dart';
import 'package:flutter_test_application/pages/login_page.dart';
import 'package:flutter_test_application/pages/main_page.dart';

class AppRoutes {
  static final pages = {
    "/": (context) => LoginPage(),
    "/home": (context) => HomePage(),
    "/main": (context) => MainPage(),
    "/edit_profile": (context) => EditProFilePage(),
  };

  static const login = "/";
  static const home = "/home";
  static const main = "/main";
  static const editProfile = "/edit_profile";
}
