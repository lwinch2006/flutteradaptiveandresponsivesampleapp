import 'package:flutter/material.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppHorizontalSpacer extends StatelessWidget {
  const AppHorizontalSpacer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: theme_data.verticalSpacerSize,
    );
  }
}
