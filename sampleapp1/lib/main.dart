import 'package:flutter/material.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;
import 'extensions/build_context_extensions.dart';

void main() {
  final router = generateRouter();

  runApp(MaterialApp.router(




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
  ));
}