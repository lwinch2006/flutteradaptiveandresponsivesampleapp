import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_detail_view.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_view.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppListDetailLayoutTwoPane extends StatelessWidget {
  const AppListDetailLayoutTwoPane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutTwoPane: build()');
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(theme_data.commonPaddingValue),
            child: AppListView(),
          ),
        ),
        VerticalDivider(
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(theme_data.commonPaddingValue),
            child: AppDetailView(),
          ),
        ),
      ],
    );
  }
}
