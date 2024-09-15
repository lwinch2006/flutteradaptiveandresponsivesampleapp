import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_center_text.dart';
import 'package:listdetaillayout/components/app_form.dart';
import 'package:listdetaillayout/components/progress_indicators/app_progress_indicator.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';

class AppDetailView extends StatelessWidget {
  const AppDetailView({
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
        if (state.isDeletingData) {
          return const AppProgressIndicator(label: 'Deleting data...');
        }
        if (state.isLoadingData) {
          return const AppProgressIndicator(label: 'Loading data...');
        }
        if (state.isAddingDataError ||
            state.isUpdatingDataError ||
            state.isDeletingDataError ||
            state.isLoadingDataError) {
          return AppCenterText(data: detailsViewState.error.value!);
        }

        if (state.isLoadedData) {
          return ValueListenableBuilder(
            valueListenable: context.listViewSelectedItemState!.selectedItem,
            builder: (context, selectedItem, child) {
              debugPrint('AppDetailView: ValueListenableBuilder2.build()');

              if (selectedItem != null) {
                return AppForm(detailViewViewModel: selectedItem);
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
