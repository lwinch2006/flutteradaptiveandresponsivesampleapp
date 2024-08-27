import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_list_detail_layout_two_pane.dart';
import 'package:listdetaillayout/components/app_list_view.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';

class AppListDetailLayout extends StatelessWidget {
  final AppListDetailLayoutTypes appListDetailLayoutType;
  const AppListDetailLayout({super.key, required this.appListDetailLayoutType});

  @override
  Widget build(BuildContext context) {
    return appListDetailLayoutType.isTwoPane
        ? const AppListDetailLayoutTwoPane()
        : AppListView(items: context.appState.listViewItems.value);
  }
}
