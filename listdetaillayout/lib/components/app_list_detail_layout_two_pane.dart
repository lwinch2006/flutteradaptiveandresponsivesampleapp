import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_detail_view.dart';
import 'package:listdetaillayout/components/app_list_view.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';

class AppListDetailLayoutTwoPane extends StatelessWidget {
  const AppListDetailLayoutTwoPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: AppListView(items: context.appState.listViewItems.value)),
        const VerticalDivider(
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
            flex: 4,
            child: ValueListenableBuilder(
              valueListenable: context.appState.selectedListViewItemIndex,
              builder: (context, selectedIndex, child) {
                final selectedListViewItem = selectedIndex >= 0
                    ? context.appState.listViewItems.value[selectedIndex]
                    : null;

                return AppDetailView(
                  selectedListViewItemDTO: selectedListViewItem,
                );
              },
            )

            //const AppDetailView(),
            ),
      ],
    );
  }
}
