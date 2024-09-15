import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppNavigationRail extends StatefulWidget {
  final int currentIndex;
  const AppNavigationRail({super.key, required this.currentIndex});

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
      listViewSelectedItemState: context.listViewSelectedItemState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationRail: build()');
    return NavigationRail(
      backgroundColor: theme_data.navigationBackgroundColor,
      labelType: NavigationRailLabelType.all,
      destinations: navigationDestinations.map((e) {
        return NavigationRailDestination(
          icon: Icon(e.icon),
          label: Text(e.label),
        );
      }).toList(),
      selectedIndex: widget.currentIndex,
      onDestinationSelected: (selectedIndex) {
        navigationService.onDestinationSelected(
            context, commonState, widget.currentIndex, selectedIndex);
      },
    );
  }
}
