import 'package:flutter/material.dart';
import 'package:listdetaillayout/services/app_service.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppHeader extends AppBar {
  AppHeader(
      {super.key,
      required appInitState,
      required header,
      required BuildContext context})
      : super(
          backgroundColor: theme_data.appBarBackgroundColor,
          title: Text(
            header,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: kDefaultFontSize),
          ),
          centerTitle: false,
          actions: <Widget>[
            if (appInitState)
              IconButton(
                  onPressed: () => AppService()..appClose(context),
                  icon: Icon(Icons.exit_to_app_outlined))
          ],
        );
}
