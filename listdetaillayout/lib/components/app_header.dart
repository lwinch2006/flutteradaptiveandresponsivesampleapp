import 'package:flutter/material.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppHeader extends AppBar {
  AppHeader(
      {super.key,
      required bool showCloseButton,
      required String header,
      bool centerHeader = false,
      required BuildContext context})
      : super(
          backgroundColor: theme_data.appBarBackgroundColor,
          title: Text(
            header,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: centerHeader,
          actions: <Widget>[
            if (showCloseButton)
              IconButton(
                  onPressed: () => appService.closeApp(context),
                  icon: const Icon(Icons.exit_to_app_outlined))
          ],
        );
}
