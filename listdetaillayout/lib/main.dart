import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

void main() {
  final router = generateRouter();

  runApp(AppStateWidget(
    initStatus: ValueNotifier(false),
    listViewItems: ValueNotifier([]),
    selectedListViewItemIndex: ValueNotifier(-1),
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
      locale: const Locale('no'),
    ),
  ));
}
