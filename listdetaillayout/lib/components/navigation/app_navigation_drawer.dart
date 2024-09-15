import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppNavigationDrawer extends StatefulWidget {
  final int currentIndex;
  const AppNavigationDrawer({super.key, required this.currentIndex});

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  late Widget navigationDrawer = getNavigationDrawer();
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

  Widget getNavigationDrawer() {
    return NavigationDrawer(
      selectedIndex: widget.currentIndex,
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
            context, commonState, widget.currentIndex, selectedIndex);
      },
    );
  }

  @override
  void didUpdateWidget(covariant AppNavigationDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex == oldWidget.currentIndex) {
      return;
    }
    navigationDrawer = getNavigationDrawer();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationDrawer: build()');
    return SizedBox(
      width: 200.0,
      child: navigationDrawer,
    );
  }
}
