import 'package:flutter/material.dart';

displayDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog.adaptive(
        title: Text("You Won"),
      );
    },
  ).then((value) => Navigator.pop(context));
}
