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

    // if (listViewItems.value.length != oldWidget.listViewItems.value.length) {
    //   return true;
    // }
    //
    // for (var i = 0; i < listViewItems.value.length; i++) {
    //   if (listViewItems.value[i] != oldWidget.listViewItems.value[i]) {
    //     return true;
    //   }
    // }
    //
    // return false;
    //
    // listViewItems.
  }

  static ListViewItemsStateWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListViewItemsStateWidget>()!;
  }
}
