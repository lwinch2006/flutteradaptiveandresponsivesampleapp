import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class AppListView extends StatelessWidget {
  final List<ListViewViewModel> items;
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
            context.selectItemState!.selectedItemIndex.value = index;
          },
        );
      },
    );
  }
}
