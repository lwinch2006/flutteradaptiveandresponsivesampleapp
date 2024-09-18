import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/app_state_types.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

void main() {
  final router = generateRouter();

  runApp(
    AppStateWidget(
      state: ValueNotifier(AppStateTypes.notInitialized),
      child: ListViewItemsStateWidget(
        listViewItems: ValueNotifier([]),
        filteredListViewItems: ValueNotifier([]),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: theme_data.colorScheme,
            scaffoldBackgroundColor: theme_data.bodyBackGroundColor,
            listTileTheme: ListTileThemeData(
              selectedTileColor: theme_data.selectedTileColor,
              shape: const StadiumBorder(),
            ),
            useMaterial3: true,
          ),
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('no'),
        ),
      ),
    ),
  );
}
