import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class ListViewItemsStateWidget extends InheritedWidget {
  final ValueNotifier<List<ListViewViewModel>> listViewItems;

  const ListViewItemsStateWidget({
    super.key,
    required super.child,
    required this.listViewItems,
  });

  @override
  bool updateShouldNotify(covariant ListViewItemsStateWidget oldWidget) {
    return listViewItems != oldWidget.listViewItems;
  }

  static ListViewItemsStateWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListViewItemsStateWidget>()!;
  }
}
