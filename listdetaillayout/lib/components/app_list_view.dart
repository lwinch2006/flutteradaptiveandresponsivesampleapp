import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/list_view_item_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';

class AppListView extends StatelessWidget {
  final List<ListViewItemDTO> items;
  const AppListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.key_outlined),
          title: Text(items[index].title),
          titleAlignment: ListTileTitleAlignment.center,
          onTap: () {
            debugPrint('Selected list view item index: $index');
            context.appState.selectedListViewItemIndex.value = index;
          },
        );
      },
    );
  }
}
