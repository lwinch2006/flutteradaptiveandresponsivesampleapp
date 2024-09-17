import 'package:flutter/material.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/details_view_pane.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_view_pane.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class ListDetailsLayoutTwoPane extends StatelessWidget {
  const ListDetailsLayoutTwoPane({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppListDetailLayoutTwoPane: build()');
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(theme_data.commonPaddingValue),
            child: ListViewPane(),
          ),
        ),
        VerticalDivider(
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(theme_data.commonPaddingValue),
            child: DetailsViewPane(),
          ),
        ),
      ],
    );
  }
}
