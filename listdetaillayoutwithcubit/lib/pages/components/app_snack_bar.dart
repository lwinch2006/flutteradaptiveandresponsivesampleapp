import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar(
      {super.key, required String content, required String buttonCloseLabel})
      : super(
          behavior: SnackBarBehavior.floating,
          width: 400.0,
          duration: const Duration(milliseconds: 1000),
          content: Text(content),
          action: SnackBarAction(
            label: buttonCloseLabel,
            onPressed: () {},
          ),
        );
}
