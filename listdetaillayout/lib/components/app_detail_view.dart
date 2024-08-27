import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_center_text.dart';
import 'package:listdetaillayout/components/app_progress_indicator.dart';
import 'package:listdetaillayout/dtos/list_view_item_dto.dart';
import 'package:listdetaillayout/services.dart';

class AppDetailView extends StatelessWidget {
  final ListViewItemDTO? selectedListViewItemDTO;
  const AppDetailView({super.key, this.selectedListViewItemDTO});

  @override
  Widget build(BuildContext context) {
    if (selectedListViewItemDTO == null) {
      return const Center(
        child: Text('Select an item from the list'),
      );
    }

    return FutureBuilder(
      future: listViewService.getItemDetails(
          selectedListViewItemDTO!.id, selectedListViewItemDTO!.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                  'Selected list view item title ${selectedListViewItemDTO!.title}'),
            );
          }

          if (snapshot.hasError) {
            return const AppCenterText(data: 'Operation failed');
          }

          return const AppCenterText(data: 'Operation completed with no data');
        }

        return const AppProgressIndicator();
      },
    );
  }
}
