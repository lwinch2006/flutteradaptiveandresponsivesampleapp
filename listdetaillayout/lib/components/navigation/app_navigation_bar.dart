import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppNavigationBar extends StatefulWidget {
  final int currentIndex;

  const AppNavigationBar({super.key, required this.currentIndex});

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
      listViewSelectedItemState: context.listViewSelectedItemState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationBar: build()');
    return NavigationBar(
      backgroundColor: theme_data.navigationBackgroundColor,
      selectedIndex: widget.currentIndex,
      destinations: navigationDestinations.map((e) {
        return NavigationDestination(icon: Icon(e.icon), label: e.label);
      }).toList(),
      onDestinationSelected: (selectedIndex) {
        navigationService.onDestinationSelected(
            context, commonState, widget.currentIndex, selectedIndex);
      },
    );
  }
}
