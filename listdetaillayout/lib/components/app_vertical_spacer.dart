import 'package:flutter/material.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppVerticalSpacer extends StatelessWidget {
  const AppVerticalSpacer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: theme_data.verticalSpacerSize,
    );
  }
}
