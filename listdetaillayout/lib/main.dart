import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/enums/app_state_types.dart';
import 'package:listdetaillayout/models/states/app_state_widget.dart';
import 'package:listdetaillayout/models/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/models/states/navigation_current_index_state_widget.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

void main() {
  final router = generateRouter();

  runApp(
    AppStateWidget(
      state: ValueNotifier(AppStateTypes.notInitialized),
      child: NavigationCurrentIndexStateWidget(
        currentIndex: ValueNotifier(-1),
        child: ListViewItemsStateWidget(
          listViewItems: ValueNotifier([]),
          filteredListViewItems: ValueNotifier([]),
          filterQueryString: ValueNotifier(""),
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
    ),
  );
}
