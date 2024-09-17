import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';

class ListViewSelectedItemStateWidget extends InheritedWidget {
  final ValueNotifier<ListItemDetailsViewModel?> selectedItem;
  const ListViewSelectedItemStateWidget({
    super.key,
    required super.child,
    required this.selectedItem,
  });

  @override
  bool updateShouldNotify(covariant ListViewSelectedItemStateWidget oldWidget) {
    return selectedItem != oldWidget.selectedItem;
  }

  static ListViewSelectedItemStateWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListViewSelectedItemStateWidget>();
  }
}
