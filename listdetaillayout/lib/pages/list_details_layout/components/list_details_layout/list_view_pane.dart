import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class ListViewPane extends StatefulWidget {
  const ListViewPane({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ListViewPaneState();
}

class _ListViewPaneState extends State<ListViewPane> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    commonState = CommonStateDto(
      listViewItemsState: context.listViewItemsState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      listViewSelectedItemState: context.listViewSelectedItemState,
      detailsViewState: context.detailsViewState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListView: Widget.build()');

    return ValueListenableBuilder(
      valueListenable: context.listViewItemsState.listViewItems,
      builder: (context, listViewItems, child) {
        debugPrint('AppListView: ValueListenableBuilder1.build()');

        return ValueListenableBuilder(
          valueListenable: context.listViewSelectedIndexState!.selectedIndex,
          builder: (context, selectedIndex, _) {
            debugPrint('AppListView: ValueListenableBuilder2.build()');

            return Material(
              color: theme_data.userContentBackgroundColor,
              child: ListView.builder(
                itemCount: listViewItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: index == selectedIndex,
                    leading: const Icon(Icons.key_outlined),
                    title: Text(listViewItems[index].title),
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: PopupMenuButton<int>(
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(
                            value: listViewItems[index].id,
                            child: const Text('Delete'),
                          ),
                        ];
                      },
                      onSelected: (itemId) async {
                        await listDetailLayoutService.deleteItem(
                            itemId, commonState);
                      },
                    ),

                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.more_vert),
                    // ),
                    onTap: () async => await listDetailLayoutService
                        .onListTileTap(index, commonState),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
