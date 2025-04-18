import "package:flutter/material.dart";
import "package:flutter_test_application/styles/app_colors.dart";
import "package:flutter_test_application/styles/app_text.dart";

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: AppText.header1.copyWith(
          color: AppColors.primary,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
