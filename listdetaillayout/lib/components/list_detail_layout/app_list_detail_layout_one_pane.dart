import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_detail_view.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_view.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';

class AppListDetailLayoutOnePane extends StatelessWidget {
  const AppListDetailLayoutOnePane({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.selectItemState!.selectedItemIndex,
      builder: (context, selectedIndex, child) {
        if (selectedIndex < 0) {
          return AppListView(items: context.appState.listViewItems.value);
        }

        return AppDetailView(
            selectedListViewViewModel:
                context.appState.listViewItems.value[selectedIndex]);
      },
    );
  }
}
