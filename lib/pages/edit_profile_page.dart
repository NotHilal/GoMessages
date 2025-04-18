import 'package:flutter/material.dart';
import 'package:flutter_test_application/components/app_text_field.dart';
import 'package:flutter_test_application/components/toolbar.dart';

class EditProFilePage extends StatelessWidget {
  const EditProFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Edit Profile",
      ),
      body: Column(
        children: [
          AppTextField(hint: "First Name"),
          AppTextField(hint: "Last Name"),
          AppTextField(hint: "Phone number"),
          AppTextField(hint: "Location"),
        ],
      ),
    );
  }
}
