import 'package:flutter/material.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/states/app_init_state_widget.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

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
