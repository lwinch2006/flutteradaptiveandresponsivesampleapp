import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';

class DetailsViewFormCloseButton extends StatefulWidget {
  const DetailsViewFormCloseButton({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsViewFormCloseButtonState();
}

class _DetailsViewFormCloseButtonState
    extends State<DetailsViewFormCloseButton> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('_AppFormSaveButtonState: didChangeDependencies()');
    commonState = CommonStateDto(
      detailsViewState: context.detailsViewState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      listViewSelectedItemState: context.listViewSelectedItemState,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppFormCloseButton: build()');
    return ElevatedButton(
      onPressed: () => listDetailLayoutService.closeItemDetails(commonState),
      child: const Text('Close'),
    );
  }
}
