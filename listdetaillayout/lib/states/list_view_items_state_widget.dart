import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/list_items_viewmodel.dart';

class ListViewItemsStateWidget extends InheritedWidget {
  final ValueNotifier<List<ListItemsViewModel>> listViewItems;
  final ValueNotifier<List<ListItemsViewModel>> filteredListViewItems;

  const ListViewItemsStateWidget({
    super.key,
    required super.child,
    required this.listViewItems,
    required this.filteredListViewItems,
  });

  @override
  bool updateShouldNotify(covariant ListViewItemsStateWidget oldWidget) {
    return filteredListViewItems != oldWidget.filteredListViewItems;
  }

  static ListViewItemsStateWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListViewItemsStateWidget>()!;
  }
}
