import 'package:flutter/material.dart';

class NavigationCurrentIndexStateWidget extends InheritedWidget {
  final ValueNotifier<int> currentIndex;
  const NavigationCurrentIndexStateWidget({
    super.key,
    required super.child,
    required this.currentIndex,
  });

  @override
  bool updateShouldNotify(
      covariant NavigationCurrentIndexStateWidget oldWidget) {
    return currentIndex != oldWidget.currentIndex;
  }

  static NavigationCurrentIndexStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        NavigationCurrentIndexStateWidget>()!;
  }
}
