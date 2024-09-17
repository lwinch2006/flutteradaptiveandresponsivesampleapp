import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/details_view_pane.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_view_pane.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class ListDetailsLayoutOnePane extends StatelessWidget {
  const ListDetailsLayoutOnePane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutOnePane: build()');
    return ValueListenableBuilder(
      valueListenable: context.listViewSelectedIndexState!.selectedIndex,
      builder: (context, selectedIndex, child) {
        if (selectedIndex >= 0) {
          return const Padding(
            padding: const EdgeInsets.all(theme_data.commonPaddingValue),
            child: DetailsViewPane(),
          );
        }

        if (context.listViewSelectedItemState!.selectedItem.value != null) {
          return const Padding(
            padding: const EdgeInsets.all(theme_data.commonPaddingValue),
            child: DetailsViewPane(),
          );
        }

        return const Padding(
          padding: const EdgeInsets.all(theme_data.commonPaddingValue),
          child: ListViewPane(),
        );
      },
    );
  }
}
