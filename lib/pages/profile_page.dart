import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_test_application/components/toolbar.dart';
import 'package:flutter_test_application/components/user_avatar.dart';
import 'package:flutter_test_application/config/app_routes.dart';
import 'package:flutter_test_application/config/app_strings.dart';
import 'package:flutter_test_application/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
              onSelected: (value) {
                switch (value) {
                  case ProfileMenu.edit:
                    Navigator.of(context).pushNamed(AppRoutes.editProfile);
                    break;
                  case ProfileMenu.logout:
                    print("Logout");
                    break;
                  default:
                }
              },
              icon: const Icon(Icons.more_vert_rounded),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(AppStrings.editProfile),
                    value: ProfileMenu.edit,
                  ),
                  PopupMenuItem(
                    child: Text(AppStrings.logout),
                    value: ProfileMenu.logout,
                  ),
                ];
              })
        ],
      ),
      body: Column(
        children: [
          UserAvatar(size: 90),
          Text(
            "Hilal Elayoubi",
            style: AppText.header2,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Paris, France",
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("472", style: AppText.header2),
                  Text(AppStrings.followers),
                ],
              ),
              Column(
                children: [
                  Text("119", style: AppText.header2),
                  Text(AppStrings.posts),
                ],
              ),
              Column(
                children: [
                  Text("218", style: AppText.header2),
                  Text(AppStrings.following),
                ],
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 24,
          )
        ],
      ),
    );
  }
}
