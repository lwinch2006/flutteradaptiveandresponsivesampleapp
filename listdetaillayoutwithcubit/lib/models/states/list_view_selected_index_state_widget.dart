import 'package:flutter/material.dart';

class ListViewSelectedIndexStateWidget extends InheritedWidget {
  final ValueNotifier<int> selectedIndex;
  const ListViewSelectedIndexStateWidget({
    super.key,
    required super.child,
    required this.selectedIndex,
  });

  @override
  bool updateShouldNotify(
      covariant ListViewSelectedIndexStateWidget oldWidget) {
    return selectedIndex != oldWidget.selectedIndex;
  }

  static ListViewSelectedIndexStateWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListViewSelectedIndexStateWidget>();
  }
}
