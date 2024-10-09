import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_detail_layout_state.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_progress_indicator.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;

class ListViewPane extends StatefulWidget {
  const ListViewPane({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ListViewPaneState();
}

class _ListViewPaneState extends State<ListViewPane> {
  late final ListDetailLayoutCubit listDetailLayoutCubit;

  @override
  void initState() {
    super.initState();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();
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

    return BlocConsumer<ListDetailLayoutCubit, ListDetailLayoutState>(
      listener: (context, state) {},
      buildWhen: (previousListDetailLayoutState, currentListDetailLayoutState) {
        return currentListDetailLayoutState.filteredListViewItems !=
                previousListDetailLayoutState.filteredListViewItems ||
            currentListDetailLayoutState.listViewSelectedIndex !=
                previousListDetailLayoutState.listViewSelectedIndex;
      },
      builder: (context, listDetailLayoutState) {
        debugPrint('AppListView: BlocConsumer.build()');

        return Material(
          color: theme_data.userContentBackgroundColor,
          child: ListView.builder(
            itemCount: listDetailLayoutState.filteredListViewItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                selected: index == listDetailLayoutState.listViewSelectedIndex,
                leading: const Icon(Icons.key_outlined),
                title: Text(
                    listDetailLayoutState.filteredListViewItems[index].title),
                titleAlignment: ListTileTitleAlignment.center,
                trailing: PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<int>>[
                      PopupMenuItem(
                        value: listDetailLayoutState
                            .filteredListViewItems[index].id,
                        child: const Text('Delete'),
                      ),
                    ];
                  },
                  onSelected: (itemId) async {
                    showLoadingDialog();
                    await listDetailLayoutCubit.deleteItem(itemId);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                onTap: () async {
                  await listDetailLayoutCubit.onListTileTap(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}
