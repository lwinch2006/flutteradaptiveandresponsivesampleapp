import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({super.key});

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    commonState = CommonStateDto(
      appState: context.appState,
      listViewItemsState: context.listViewItemsState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      listViewSelectedItemState: context.listViewSelectedItemState,
      navigationCurrentIndexState: context.navigationCurrentIndexState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationDrawer: build()');
    return SizedBox(
      width: 200.0,
      child: ValueListenableBuilder(
        valueListenable: context.navigationCurrentIndexState.currentIndex,
        builder: (context, selectedIndex, child) {
          debugPrint('AppNavigationDrawer: ValueListenableBuilder: build()');
          return NavigationDrawer(
            selectedIndex: selectedIndex,
            backgroundColor: theme_data.navigationBackgroundColor,
            tilePadding: const EdgeInsetsDirectional.symmetric(vertical: 0.0),
            children: navigationDestinations.map((e) {
              return NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.label),
              );
            }).toList(),
            onDestinationSelected: (selectedIndex) {
              navigationService.onDestinationSelected(
                  context, commonState, selectedIndex);
            },
          );
        },
      ),
    );
  }
}
