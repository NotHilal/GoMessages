import 'package:flutter/material.dart';
import 'package:flutter_test_application/styles/app_colors.dart';
import 'package:flutter_test_application/styles/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: false,
          title: const Text("GoMesseges",
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          actions: [Icon(Icons.location_on_outlined)],
        ),
        body: ListView(
          children: mockUsersFromServer(),
        ));
  }

  Widget _userItem() {
    return Row(
      children: [
        Image.asset(
          "assets/temp/user1.png",
          width: 40,
          height: 40,
        ),
        SizedBox(width: 16),
        Text(
          "Hilal Elayoubi",
          style: AppText.subtitle3,
        ),
      ],
    );
  }

  List<Widget> mockUsersFromServer() {
    List<Widget> users = [];
    for (int i = 0; i < 100; i++) {
      users.add(_userItem());
    }
    return users;
  }
}
