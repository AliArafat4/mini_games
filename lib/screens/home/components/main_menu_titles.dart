import 'package:flutter/material.dart';

class MainMenuTitles extends StatelessWidget {
  const MainMenuTitles({
    super.key,
    required this.iconWidget,
    required this.title,
    required this.onPressed,
  });

  final Widget iconWidget;
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            Text(title),
          ],
        ));
  }
}
