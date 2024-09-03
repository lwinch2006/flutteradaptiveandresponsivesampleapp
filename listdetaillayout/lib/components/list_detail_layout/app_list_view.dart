import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class AppListView extends StatelessWidget {
  final List<ListViewViewModel> items;
  const AppListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    debugPrint('Calling build() of AppListView');
    return ListenableBuilder(
      listenable: context.selectItemState!.selectedItemIndex,
      builder: (context, _) {
        debugPrint('Calling build() of ListView.builder');

        return Material(
          color: theme_data.userContentBackgroundColor,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                selected:
                    index == context.selectItemState!.selectedItemIndex.value,
                leading: const Icon(Icons.key_outlined),
                title: Text(items[index].title),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  debugPrint('Selected list view item index: $index');
                  context.selectItemState!.selectedItemIndex.value = index;
                },
              );
            },
          ),
        );
      },
    );
  }
}
