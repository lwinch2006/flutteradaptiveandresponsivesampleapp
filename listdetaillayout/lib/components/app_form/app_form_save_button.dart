import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

class AppFormSaveButton extends StatefulWidget {
  final bool isAddMode;
  final DetailViewViewModel detailViewViewModel;

  const AppFormSaveButton({
    super.key,
    required this.isAddMode,
    required this.detailViewViewModel,
  });

  @override
  State<StatefulWidget> createState() => _AppFormSaveButtonState();
}

class _AppFormSaveButtonState extends State<AppFormSaveButton> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('_AppFormSaveButtonState: didChangeDependencies()');
    commonState = CommonStateDto(
      detailsViewState: context.detailsViewState,
      listViewSelectedItemState: context.listViewSelectedItemState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppFormSaveButton: build()');
    return FilledButton(
      onPressed: () async {
        if (widget.isAddMode) {
          await listDetailLayoutService.addItemDetails(
            widget.detailViewViewModel,
            commonState,
          );
        } else {
          await listDetailLayoutService.updateItemDetails(
            widget.detailViewViewModel,
            commonState,
          );
        }
      },
      child: const Text('Save'),
    );
  }
}
