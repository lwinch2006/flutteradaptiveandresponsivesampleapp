import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_state_types.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_center_text.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_parts/app_header.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_progress_indicator.dart';
import 'package:listdetaillayoutwithcubit/routes.dart' as routes;
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    appCubit.resetApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        header: widget.title,
        centerHeader: true,
        context: context,
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listenWhen: (previousAppState, currentAppState) =>
            currentAppState.state.isInitialized,
        listener: (context, appState) {
          final listViewItems = appState.listViewItems;
          context.go(
            routes.listDetailLayoutPagePath,
            extra: listViewItems,
          );
        },
        buildWhen: (previousAppState, currentAppState) =>
            currentAppState.state != AppStateTypes.initialized,
        builder: (context, appState) {
          if (appState.state.isNotInitialized) {
            return Center(
              child: FilledButton(
                  onPressed: () async => await appCubit.initApp(),
                  child: Text(context.l10n.buttonStart)),
            );
          }

          if (appState.state.isInitializing) {
            return AppProgressIndicator(
              label: context.l10n.progressIndicatorLoading,
            );
          }

          if (appState.state.isInitializationError) {
            return const AppCenterText(data: 'Operation failed');
          }

          return const AppCenterText(data: '');
        },
      ),
    );
  }
}
