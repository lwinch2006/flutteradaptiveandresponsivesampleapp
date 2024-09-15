import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services.dart';

class AppFormCloseButton extends StatefulWidget {
  const AppFormCloseButton({super.key});

  @override
  State<StatefulWidget> createState() => _AppFormCloseButtonState();
}

class _AppFormCloseButtonState extends State<AppFormCloseButton> {
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
