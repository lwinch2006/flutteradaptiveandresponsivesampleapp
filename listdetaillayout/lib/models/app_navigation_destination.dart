import 'package:flutter/material.dart';

final class AppNavigationDestination {
  final IconData icon;
  final String label;
  String? route;
  Function? action;
  AppNavigationDestination(
      {required this.icon, required this.label, this.route, this.action})
      : assert(route != null || action != null,
            'Either route or action should be defined');
}
