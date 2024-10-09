import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_detail_layout_state.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_vertical_spacer_20.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/details_view_pane.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_details_layout_pane_container.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_view_pane.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_view_search_bar.dart';

class ListDetailsLayoutOnePane extends StatefulWidget {
  const ListDetailsLayoutOnePane({super.key});

  @override
  State<StatefulWidget> createState() => _ListDetailsLayoutOnePaneState();
}

class _ListDetailsLayoutOnePaneState extends State<ListDetailsLayoutOnePane> {
  late final ListDetailLayoutCubit listDetailLayoutCubit;

  @override
  void initState() {
    super.initState();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutOnePane: build()');
    return BlocConsumer<ListDetailLayoutCubit, ListDetailLayoutState>(
      listener: (context, listDetailLayoutState) {},
      buildWhen: (previousListDetailLayoutState, currentListDetailLayoutState) {
        return currentListDetailLayoutState.listViewSelectedIndex !=
                previousListDetailLayoutState.listViewSelectedIndex ||
            currentListDetailLayoutState.detailViewSelectedItem !=
                previousListDetailLayoutState.detailViewSelectedItem;
      },
      builder: (context, listDetailLayoutState) {
        if (listDetailLayoutState.listViewSelectedIndex >= 0) {
          return const ListDetailsLayoutPaneContainer(
            child: DetailsViewPane(),
          );
        }

        if (listDetailLayoutState.detailViewSelectedItem != null) {
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
