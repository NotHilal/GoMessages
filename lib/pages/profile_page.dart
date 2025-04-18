import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_test_application/components/toolbar.dart';
import 'package:flutter_test_application/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Profile",
        actions: [
          PopupMenuButton<ProfileMenu>(
              onSelected: (value) {
                switch (value) {
                  case ProfileMenu.edit:
                    Navigator.of(context).pushNamed("/edit_profile");
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
                    child: Text("Edit"),
                    value: ProfileMenu.edit,
                  ),
                  PopupMenuItem(
                    child: Text("Logout"),
                    value: ProfileMenu.logout,
                  ),
                ];
              })
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              "assets/temp/user1.png",
              width: 90,
              height: 90,
            ),
          ),
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
                  Text("Folowers"),
                ],
              ),
              Column(
                children: [
                  Text("119", style: AppText.header2),
                  Text("Posts"),
                ],
              ),
              Column(
                children: [
                  Text("218", style: AppText.header2),
                  Text("Folowing"),
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
