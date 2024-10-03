import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({super.key});

  @override
  State<StatefulWidget> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    commonState = CommonStateDto(
      appState: context.appState,
      listViewItemsState: context.listViewItemsState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      detailsViewSelectedItemState: context.detailsViewSelectedItemState,
      navigationCurrentIndexState: context.navigationCurrentIndexState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationRail: build()');
    return ValueListenableBuilder(
      valueListenable: context.navigationCurrentIndexState.currentIndex,
      builder: (context, selectedIndex, child) {
        debugPrint('AppNavigationRail: ValueListenableBuilder: build()');
        return NavigationRail(
          backgroundColor: theme_data.navigationBackgroundColor,
          labelType: NavigationRailLabelType.all,
          destinations: navigationDestinations.map((e) {
            return NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.label),
            );
          }).toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: (selectedIndex) {
            navigationService.onDestinationSelected(
                context, commonState, selectedIndex);
          },
        );
      },
    );
  }
}
