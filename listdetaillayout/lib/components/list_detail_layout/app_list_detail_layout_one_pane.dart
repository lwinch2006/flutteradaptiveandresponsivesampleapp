import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_detail_view.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_view.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppListDetailLayoutOnePane extends StatelessWidget {
  const AppListDetailLayoutOnePane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutOnePane: build()');
    return ValueListenableBuilder(
      valueListenable: context.listViewSelectedIndexState!.selectedIndex,
      builder: (context, selectedIndex, child) {
        if (selectedIndex >= 0) {
          return const Padding(
            padding: const EdgeInsets.all(theme_data.commonPaddingValue),
            child: AppDetailView(),
          );
        }

        if (context.listViewSelectedItemState!.selectedItem.value != null) {
          return const Padding(
            padding: const EdgeInsets.all(theme_data.commonPaddingValue),
            child: AppDetailView(),
          );
        }

        return const Padding(
          padding: const EdgeInsets.all(theme_data.commonPaddingValue),
          child: AppListView(),
        );
      },
    );
  }
}
