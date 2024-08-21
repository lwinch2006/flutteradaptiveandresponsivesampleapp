import 'package:flutter/material.dart';

class AppInitStateWidget extends InheritedWidget {
  final ValueNotifier<bool> appInitState;

  const AppInitStateWidget({
    super.key,
    required super.child,
    required this.appInitState,
  });

  @override
  bool updateShouldNotify(covariant AppInitStateWidget oldWidget) {
    return appInitState != oldWidget.appInitState;
  }

  static AppInitStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppInitStateWidget>()!;
  }
}
