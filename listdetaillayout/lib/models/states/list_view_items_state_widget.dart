import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/list_item_viewmodel.dart';

class ListViewItemsStateWidget extends InheritedWidget {
  final ValueNotifier<List<ListItemViewModel>> listViewItems;
  final ValueNotifier<List<ListItemViewModel>> filteredListViewItems;
  final ValueNotifier<String> filterQueryString;

  const ListViewItemsStateWidget({
    super.key,
    required super.child,
    required this.listViewItems,
    required this.filteredListViewItems,
    required this.filterQueryString,
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
