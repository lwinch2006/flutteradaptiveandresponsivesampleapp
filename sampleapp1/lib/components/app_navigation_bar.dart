import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  const AppNavigationBar(
      {super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: theme_data.navigationBackgroundColor,
      selectedIndex: currentIndex,
      destinations: navigationDestinations.map((e) {
        return NavigationDestination(icon: Icon(e.icon), label: e.label);
      }).toList(),
      onDestinationSelected: (selectedIndex) {
        if (selectedIndex == currentIndex) {
          return;
        }
        context.push(navigationDestinations[selectedIndex].route);
      },
    );
  }
}
