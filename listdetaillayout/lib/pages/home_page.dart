import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/pages/components/app_center_text.dart';
import 'package:listdetaillayout/pages/components/app_parts/app_header.dart';
import 'package:listdetaillayout/pages/components/app_progress_indicator.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/utils/extensions/build_context_extensions.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CommonStateDto commonState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    commonState = CommonStateDto(
      appState: context.appState,
      listViewItemsState: context.listViewItemsState,
      listViewSelectedIndexState: context.listViewSelectedIndexState,
      detailsViewSelectedItemState: context.detailsViewSelectedItemState,
      navigationCurrentIndexState: context.navigationCurrentIndexState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        header: widget.title,
        centerHeader: true,
        context: context,
      ),
      body: ListenableBuilder(
        listenable: context.appState.state,
        builder: (context, child) {
          if (context.appState.state.value.isNotInitialized) {
            return Center(
              child: FilledButton(
                  onPressed: () async =>
                      await appService.initApp(context, commonState),
                  child: const Text('Start')),
            );
          }

          if (context.appState.state.value.isInitializing) {
            return AppProgressIndicator(
              label: context.l10n.progressIndicatorLoading,
            );
          }

          if (context.appState.state.value.isInitializationError) {
            return const AppCenterText(data: 'Operation failed');
          }

          return const AppCenterText(data: '');
        },
      ),
    );
  }
}
