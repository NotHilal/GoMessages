import 'package:flutter/material.dart';
import 'package:flutter_test_application/components/post_item.dart';
import 'package:flutter_test_application/components/toolbar.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:flutter_test_application/styles/app_colors.dart';
import 'package:flutter_test_application/styles/app_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> users = [];
  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.appName,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined))
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
            user: users[index],
          );
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 24,
          );
        },
      ),
    );
  }

  mockUsersFromServer() {
    for (int i = 0; i < 100; i++) {
      users.add("User number $i");
    }
  }
}
