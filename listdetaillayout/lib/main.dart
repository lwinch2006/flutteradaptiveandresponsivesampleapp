import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/states/app_init_state_widget.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

void main() {
  final router = generateRouter();

  runApp(AppInitStateWidget(
    appInitState: ValueNotifier(false),
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: theme_data.colorScheme,
        useMaterial3: true,
      ),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('no'),
    ),
  ));
}
