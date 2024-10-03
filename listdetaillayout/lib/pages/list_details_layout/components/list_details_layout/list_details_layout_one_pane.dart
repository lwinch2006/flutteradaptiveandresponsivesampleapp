import 'package:flutter/material.dart';
import 'package:listdetaillayout/pages/components/app_vertical_spacer_20.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/details_view_pane.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_details_layout_pane_container.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_view_pane.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_view_search_bar.dart';
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class ListDetailsLayoutOnePane extends StatelessWidget {
  const ListDetailsLayoutOnePane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutOnePane: build()');
    return ValueListenableBuilder(
      valueListenable: context.listViewSelectedIndexState!.selectedIndex,
      builder: (context, selectedIndex, child) {
        if (selectedIndex >= 0) {
          return const ListDetailsLayoutPaneContainer(
            child: DetailsViewPane(),
          );
        }

        if (context.listViewSelectedItemState!.selectedItem.value != null) {
          return const ListDetailsLayoutPaneContainer(
            child: DetailsViewPane(),
          );
        }

        return const Column(
          children: [
            ListViewSearchBar(),
            AppVerticalSpacer20(),
            Expanded(
              child: const ListDetailsLayoutPaneContainer(
                child: ListViewPane(),
              ),
            ),
          ],
        );
      },
    );
  }
}
