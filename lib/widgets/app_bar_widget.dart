import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.hasAction,
    required this.title,
    this.height,
    required this.centered,
  });

  final bool hasAction;
  final bool centered;
  final String title;
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 2.5,
      automaticallyImplyLeading: !hasAction,
      centerTitle: centered,
      title: Text(title),
    );
  }
}
