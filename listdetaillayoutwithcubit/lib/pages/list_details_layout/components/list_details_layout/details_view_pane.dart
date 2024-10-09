import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_detail_layout_state.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_center_text.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_progress_indicator.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/details_view_form/details_view_form.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

class DetailsViewPane extends StatefulWidget {
  const DetailsViewPane({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DetailsViewPaneState();
}

class _DetailsViewPaneState extends State<DetailsViewPane> {
  late final ListDetailLayoutCubit listDetailLayoutCubit;

  @override
  void initState() {
    super.initState();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit>();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppDetailView: build()');

    return BlocConsumer<ListDetailLayoutCubit, ListDetailLayoutState>(
      listener: (context, listDetailLayoutState) {},
      buildWhen: (previousListDetailLayoutState, currentListDetailLayoutState) {
        return currentListDetailLayoutState.detailViewState !=
                previousListDetailLayoutState.detailViewState ||
            currentListDetailLayoutState.detailViewSelectedItem !=
                previousListDetailLayoutState.detailViewSelectedItem;
      },
      builder: (context, listDetailLayoutState) {
        debugPrint('AppDetailView: BlocConsumer.build()');

        if (listDetailLayoutState.detailViewState.isAddingData) {
          return AppProgressIndicator(
              label: context.l10n.progressIndicatorAddingData);
        }

        if (listDetailLayoutState.detailViewState.isUpdatingData) {
          return AppProgressIndicator(
              label: context.l10n.progressIndicatorUpdatingData);
        }
        if (listDetailLayoutState.detailViewState.isLoadingData) {
          return AppProgressIndicator(
              label: context.l10n.progressIndicatorLoadingData);
        }

        if (listDetailLayoutState.detailViewState.isAddingDataError ||
            listDetailLayoutState.detailViewState.isUpdatingDataError ||
            listDetailLayoutState.detailViewState.isLoadingDataError) {
          return AppCenterText(
              data: listDetailLayoutState.detailViewStateError!);
        }

        if (listDetailLayoutState.detailViewState.isLoadedData) {
          if (listDetailLayoutState.detailViewSelectedItem != null) {
            return DetailsViewForm(
                detailViewViewModel:
                    listDetailLayoutState.detailViewSelectedItem!);
          }

          if (listDetailLayoutState.detailViewSelectedItem == null) {
            return AppCenterText(data: context.l10n.infoMessageSelectListItem);
          }
        }

        return const AppCenterText(
          data: '',
        );
      },
    );
  }
}
