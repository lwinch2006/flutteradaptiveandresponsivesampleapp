import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_detail_layout_one_pane.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_detail_layout_two_pane.dart';
import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';

class AppListDetailLayout extends StatelessWidget {
  final AppListDetailLayoutTypes appListDetailLayoutType;
  const AppListDetailLayout({super.key, required this.appListDetailLayoutType});

  @override
  Widget build(BuildContext context) {
    return appListDetailLayoutType.isTwoPane
        ? const AppListDetailLayoutTwoPane()
        : const AppListDetailLayoutOnePane();
  }
}
