import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_center_text.dart';
import 'package:listdetaillayout/components/app_progress_indicator.dart';
import 'package:listdetaillayout/components/app_text_form_field.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class AppDetailView extends StatelessWidget {
  final ListViewViewModel? selectedListViewViewModel;
  const AppDetailView({super.key, this.selectedListViewViewModel});

  @override
  Widget build(BuildContext context) {
    if (selectedListViewViewModel == null) {
      return const Center(
        child: Text('Select an item from the list'),
      );
    }

    if (context.selectItemState?.itemDetails.value?.itemId ==
        selectedListViewViewModel!.id) {
      final detailViewViewModel = context.selectItemState!.itemDetails.value!;

      return Center(
        child: SizedBox(
          width: theme_data.formWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextFormField(
                  icon: Icons.person,
                  label: 'Username',
                  text: detailViewViewModel.username,
                  isReadOnly: true,
                  isHiddenText: false,
                  isVisibilityButtonShown: false),
              const SizedBox(
                height: theme_data.verticalSpacerSize,
              ),
              AppTextFormField(
                icon: Icons.key_outlined,
                label: 'Password',
                text: detailViewViewModel.password,
                isReadOnly: true,
                isHiddenText: true,
                isVisibilityButtonShown: true,
              ),
              const SizedBox(
                height: theme_data.verticalSpacerSize,
              ),
              ElevatedButton(
                onPressed: () => listViewService.closeItemDetails(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      );
    }

    return FutureBuilder(
      future: listViewService.getItemDetails(
          selectedListViewViewModel!.id, selectedListViewViewModel!.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final detailViewViewModel = snapshot.data!;
            context.selectItemState!.itemDetails.value = snapshot.data;

            return Center(
              child: SizedBox(
                width: theme_data.formWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                        icon: Icons.person,
                        label: 'Username',
                        text: detailViewViewModel.username,
                        isReadOnly: true,
                        isHiddenText: false,
                        isVisibilityButtonShown: false),
                    const SizedBox(
                      height: theme_data.verticalSpacerSize,
                    ),
                    AppTextFormField(
                      icon: Icons.key_outlined,
                      label: 'Password',
                      text: detailViewViewModel.password,
                      isReadOnly: true,
                      isHiddenText: true,
                      isVisibilityButtonShown: true,
                    ),
                    const SizedBox(
                      height: theme_data.verticalSpacerSize,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          listViewService.closeItemDetails(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return AppCenterText(
                data: 'Operation failed (${snapshot.error.toString()})');
          }

          return const AppCenterText(data: 'Operation completed with no data');
        }

        return const AppProgressIndicator();
      },
    );
  }
}
