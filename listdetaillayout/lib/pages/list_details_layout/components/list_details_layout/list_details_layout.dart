import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_details_layout_one_pane.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_details_layout_two_pane.dart';

class ListDetailsLayout extends StatelessWidget {
  final AppListDetailLayoutTypes appListDetailLayoutType;
  const ListDetailsLayout({super.key, required this.appListDetailLayoutType});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayout: build()');
    return appListDetailLayoutType.isTwoPane
        ? const ListDetailsLayoutTwoPane()
        : const ListDetailsLayoutOnePane();
  }
}
