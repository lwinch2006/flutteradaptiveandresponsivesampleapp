import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

class ListViewSelectedItemStateWidget extends InheritedWidget {
  final ValueNotifier<DetailViewViewModel?> selectedItem;
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
