import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class AppStateWidget extends InheritedWidget {
  final ValueNotifier<bool> initStatus;
  final ValueNotifier<List<ListViewViewModel>> listViewItems;
  final ValueNotifier<int> selectedListViewItemIndex;

  const AppStateWidget({
    super.key,
    required super.child,
    required this.initStatus,
    required this.listViewItems,
    required this.selectedListViewItemIndex,
  });

  @override
  bool updateShouldNotify(covariant AppStateWidget oldWidget) {
    return initStatus != oldWidget.initStatus ||
        listViewItems != oldWidget.listViewItems ||
        selectedListViewItemIndex != oldWidget.selectedListViewItemIndex;
  }

  static AppStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateWidget>()!;
  }
}
