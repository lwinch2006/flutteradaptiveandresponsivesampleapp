import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/pages/components/app_progress_indicator.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

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
      detailsViewSelectedItemState: context.detailsViewSelectedItemState,
      detailsViewState: context.detailsViewState,
    );
  }

  void showLoadingDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: const AppProgressIndicator(label: 'Deleting data...'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListView: Widget.build()');

    return ValueListenableBuilder(
      valueListenable: context.listViewItemsState.filteredListViewItems,
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
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(
                            value: listViewItems[index].id,
                            child: const Text('Delete'),
                          ),
                        ];
                      },
                      onSelected: (itemId) async {
                        showLoadingDialog();

                        await listDetailLayoutService.deleteItem(
                            itemId, commonState);

                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
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
