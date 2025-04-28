import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_application/config/app_icons.dart';
import 'package:flutter_test_application/config/app_routes.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:flutter_test_application/model/user.dart';
import 'package:flutter_test_application/pages/main_page.dart';
import 'package:flutter_test_application/styles/app_colors.dart';
import 'package:http/http.dart'as http;

const baseUrl = "http://10.0.2.2:8080";

class LoginPage extends StatelessWidget {

  LoginPage({super.key});
  final loginRoute = '$baseUrl/login';
  var username="";
  var password="";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                TextField(
                  onChanged: (value){
                    username=value;
                  },
                  decoration: InputDecoration(
                      hintText: AppStrings.username,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (value){
                    password=value;
                  },
                  decoration: InputDecoration(
                      hintText: AppStrings.password,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        print("Forgot is clicked");
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                      child: const Text(AppStrings.forgotPassword)),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    //Login button
                    onPressed: () async{
                      //final user = await doLogin();

                      Navigator.of(context)
                          .push(PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryanimation){
                            //return MainPage(user: user);
                            return MainPage(user: User(1, "Hilal", "Elayoubi", "0613478938", "08/10/2001", "male", true));
                          }
                           ));
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    child: const Text(AppStrings.login),
                  ),
                ),
                const Spacer(),
                const Text(
                  AppStrings.orSignInWith,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Google is clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.google,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 8),
                        const Text(AppStrings.loginWithGoogle),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print(AppStrings.loginWithFacebook);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.facebook,
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 8),
                        const Text(AppStrings.loginWithFacebook),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary),
                        child: const Text(
                          AppStrings.signup,
                        ))
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Future<User> doLogin() async{
    final body = {
      'username':username,
      'password':password,
    };
    final response = await http.post(Uri.parse(loginRoute), body: jsonEncode(body));
    if(response.statusCode==200){
      print(response.body);
      final json = jsonDecode(response.body);
      final user = User.fromJson(json['data']);

      return user;
    }
    else{
      print("You have an error");
      throw Exception("error");
    }


  }

}
