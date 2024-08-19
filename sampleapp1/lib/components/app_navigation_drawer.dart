import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

class AppNavigationDrawer extends StatelessWidget {
  final int currentIndex;

  const AppNavigationDrawer({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: currentIndex,
      backgroundColor: theme_data.navigationBackgroundColor,
      tilePadding: const EdgeInsetsDirectional.symmetric(vertical: 0.0),
      children: navigationDestinations.map((e) {
        return NavigationDrawerDestination(
            icon: Icon(e.icon), label: Text(e.label));
      }).toList(),
      onDestinationSelected: (selectedIndex) {
        if (selectedIndex == currentIndex) {
          return;
        }
        context.go(navigationDestinations[selectedIndex].route);
      },
    );
  }
}
