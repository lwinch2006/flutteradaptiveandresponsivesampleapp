import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({super.key, required String content})
      : super(
          behavior: SnackBarBehavior.floating,
          width: 400.0,
          duration: const Duration(milliseconds: 500),
          content: Text(content),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {},
          ),
        );
}
