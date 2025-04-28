import 'package:flutter_test_application/model/user.dart';
import 'package:flutter_test_application/pages/edit_profile_page.dart';
import 'package:flutter_test_application/pages/home_page.dart';
import 'package:flutter_test_application/pages/login_page.dart';
import 'package:flutter_test_application/pages/main_page.dart';
import 'package:flutter_test_application/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    main: (context) => MainPage(user: User(1, "Hilal", "Elayoubi", "0613478938", "08/10/2001", "male", true)),
    editProfile: (context) => EditProFilePage(),
    nearby: (context) => NearbyPage(),
  };

  static const login = "/";
  static const home = "/home";
  static const main = "/main";
  static const editProfile = "/edit_profile";
  static const nearby = "/nearby";

}
