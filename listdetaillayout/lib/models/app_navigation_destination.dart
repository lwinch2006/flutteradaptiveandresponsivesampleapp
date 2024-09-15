import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';

final class AppNavigationDestination {
  final IconData icon;
  final String label;
  String? route;
  Function(BuildContext, CommonStateDto)? action;
  AppNavigationDestination(
      {required this.icon, required this.label, this.route, this.action})
      : assert(route != null || action != null,
            'Either route or action should be defined');
}
