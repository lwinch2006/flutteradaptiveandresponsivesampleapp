import 'package:flutter/material.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

class ListItemSelectStateWidget extends InheritedWidget {
  final ValueNotifier<int> selectedItemIndex;
  final ValueNotifier<DetailViewViewModel?> itemDetails;

  const ListItemSelectStateWidget({
    super.key,
    required super.child,
    required this.selectedItemIndex,
    required this.itemDetails,
  });

  @override
  bool updateShouldNotify(covariant ListItemSelectStateWidget oldWidget) {
    return selectedItemIndex != oldWidget.selectedItemIndex;
  }

  static ListItemSelectStateWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ListItemSelectStateWidget>();
  }
}
