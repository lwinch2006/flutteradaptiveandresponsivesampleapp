import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppNavigationDrawer extends StatefulWidget {
  final int currentIndex;
  const AppNavigationDrawer({super.key, required this.currentIndex});

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  late Widget navigationDrawer = getNavigationDrawer();

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
        if (selectedIndex == widget.currentIndex) {
          return;
        }

        if (navigationDestinations[selectedIndex].action != null) {
          navigationDestinations[selectedIndex].action!();
        } else {
          context.go(navigationDestinations[selectedIndex].route!);
        }
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
    debugPrint('Calling build() of AppNavigationDrawer');
    return SizedBox(
      width: 200.0,
      child: navigationDrawer,
    );
  }
}
