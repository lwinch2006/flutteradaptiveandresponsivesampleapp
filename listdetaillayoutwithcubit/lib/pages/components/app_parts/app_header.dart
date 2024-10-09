import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;

class AppHeader extends AppBar {
  final String header;
  final bool centerHeader;
  final List<Widget>? actions;

  AppHeader({
    super.key,
    required this.header,
    required BuildContext context,
    this.centerHeader = false,
    this.actions,
  }) : super(
          scrolledUnderElevation: 0.0,
          backgroundColor: theme_data.appBarBackgroundColor,
          title: Text(
            header,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: centerHeader,
          actions: actions,
        );
}
