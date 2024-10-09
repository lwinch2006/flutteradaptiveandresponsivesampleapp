import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_horizontal_spacer_20.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_vertical_spacer_20.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/details_view_pane.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_details_layout_pane_container.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_view_pane.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_view_search_bar.dart';

class ListDetailsLayoutTwoPane extends StatelessWidget {
  const ListDetailsLayoutTwoPane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutTwoPane: build()');
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              ListViewSearchBar(),
              AppVerticalSpacer20(),
              Expanded(
                child: ListDetailsLayoutPaneContainer(
                  child: ListViewPane(),
                ),
              ),
            ],
          ),
        ),
        AppHorizontalSpacer20(),
        Expanded(
          flex: 4,
          child: ListDetailsLayoutPaneContainer(
            child: DetailsViewPane(),
          ),
        ),
      ],
    );
  }
}
