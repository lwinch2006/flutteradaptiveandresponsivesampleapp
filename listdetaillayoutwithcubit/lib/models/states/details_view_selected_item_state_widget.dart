import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_details_viewmodel.dart';

class DetailsViewSelectedItemStateWidget extends InheritedWidget {
  final ValueNotifier<ListItemDetailsViewModel?> selectedItem;
  const DetailsViewSelectedItemStateWidget({
    super.key,
    required super.child,
    required this.selectedItem,
  });

  @override
  bool updateShouldNotify(
      covariant DetailsViewSelectedItemStateWidget oldWidget) {
    return selectedItem != oldWidget.selectedItem;
  }

  static DetailsViewSelectedItemStateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        DetailsViewSelectedItemStateWidget>();
  }
}
