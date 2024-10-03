import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/enums/details_view_state_types.dart';

class DetailsViewStateWidget extends InheritedWidget {
  final ValueNotifier<DetailsViewStateTypes> state;
  final ValueNotifier<String?> error;

  const DetailsViewStateWidget({
    super.key,
    required super.child,
    required this.state,
    required this.error,
  });

  @override
  bool updateShouldNotify(covariant DetailsViewStateWidget oldWidget) {
    return state != oldWidget.state;
  }

  static DetailsViewStateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DetailsViewStateWidget>();
  }
}
