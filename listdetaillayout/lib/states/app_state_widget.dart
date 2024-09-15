import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/app_state_types.dart';

class AppStateWidget extends InheritedWidget {
  final ValueNotifier<AppStateTypes> state;

  const AppStateWidget({
    super.key,
    required super.child,
    required this.state,
  });

  @override
  bool updateShouldNotify(covariant AppStateWidget oldWidget) {
    return state != oldWidget.state;
  }

  static AppStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateWidget>()!;
  }
}
