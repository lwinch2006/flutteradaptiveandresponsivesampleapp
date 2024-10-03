import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
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
    debugPrint('AppNavigationBar: build()');
    return ValueListenableBuilder(
      valueListenable: context.navigationCurrentIndexState.currentIndex,
      builder: (context, selectedIndex, child) {
        debugPrint('AppNavigationBar: ValueListenableBuilder: build()');
        return NavigationBar(
          backgroundColor: theme_data.navigationBackgroundColor,
          selectedIndex: selectedIndex,
          destinations: navigationDestinations.map((e) {
            return NavigationDestination(icon: Icon(e.icon), label: e.label);
          }).toList(),
          onDestinationSelected: (selectedIndex) {
            navigationService.onDestinationSelected(
                context, commonState, selectedIndex);
          },
        );
      },
    );
  }
}
