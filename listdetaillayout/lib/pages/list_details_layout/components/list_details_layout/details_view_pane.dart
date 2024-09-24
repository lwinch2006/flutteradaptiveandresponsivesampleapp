import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_center_text.dart';
import 'package:listdetaillayout/components/app_progress_indicator.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/details_view_form/details_view_form.dart';

class DetailsViewPane extends StatelessWidget {
  const DetailsViewPane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('AppDetailView: build()');

    return ValueListenableBuilder(
      valueListenable: context.detailsViewState!.state,
      builder: (context, state, child) {
        debugPrint('AppDetailView: ValueListenableBuilder1.build()');
        final detailsViewState = context.detailsViewState!;

        if (state.isAddingData) {
          return const AppProgressIndicator(label: 'Adding data...');
        }
        if (state.isUpdatingData) {
          return const AppProgressIndicator(label: 'Updating data...');
        }
        if (state.isLoadingData) {
          return const AppProgressIndicator(label: 'Loading data...');
        }
        if (state.isAddingDataError ||
            state.isUpdatingDataError ||
            state.isLoadingDataError) {
          return AppCenterText(data: detailsViewState.error.value!);
        }

        if (state.isLoadedData) {
          return ValueListenableBuilder(
            valueListenable: context.listViewSelectedItemState!.selectedItem,
            builder: (context, selectedItem, child) {
              debugPrint('AppDetailView: ValueListenableBuilder2.build()');

              if (selectedItem != null) {
                return DetailsViewForm(detailViewViewModel: selectedItem);
              }

              if (selectedItem == null) {
                return const AppCenterText(
                    data: 'Select an item from the list');
              }

              return const AppCenterText(
                data: '',
              );
            },
          );
        }

        return const AppCenterText(data: '');
      },
    );
  }
}
