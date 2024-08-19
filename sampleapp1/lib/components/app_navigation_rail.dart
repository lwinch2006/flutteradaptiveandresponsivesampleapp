import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

class AppNavigationRail extends StatelessWidget {
  final int currentIndex;

  const AppNavigationRail(
      {super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: theme_data.navigationBackgroundColor,
      labelType: NavigationRailLabelType.all,
      destinations: navigationDestinations.map((e) {
        return NavigationRailDestination(
            icon: Icon(e.icon),
            label: Text(e.label),
        );
      }).toList(),
      selectedIndex: currentIndex,
      onDestinationSelected: (selectedIndex) {
        if (selectedIndex == currentIndex) {
          return;
        }
        context.go(navigationDestinations[selectedIndex].route);
      },
    );
  }
}
