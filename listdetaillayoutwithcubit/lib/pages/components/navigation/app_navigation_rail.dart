import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state.dart';
import 'package:listdetaillayoutwithcubit/routes.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({super.key});

  @override
  State<StatefulWidget> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  late final AppCubit appCubit;
  late final ListDetailLayoutCubit? listDetailLayoutCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    listDetailLayoutCubit = context.read<ListDetailLayoutCubit?>();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppNavigationRail: build()');
    return BlocConsumer<AppCubit, AppState>(
      listenWhen: (previousAppState, currentAppState) {
        return currentAppState.navigationCurrentIndex !=
            previousAppState.navigationCurrentIndex;
      },
      listener: (context, appState) {
        debugPrint('AppNavigationRail: BlocConsumer: listener()');

        listDetailLayoutCubit?.onNavigationDestinationSelected();

        if (navigationDestinations[appState.navigationCurrentIndex].action !=
            null) {
          navigationDestinations[appState.navigationCurrentIndex]
              .action!(listDetailLayoutCubit);
        } else {
          context.go(
              navigationDestinations[appState.navigationCurrentIndex].route!);
        }
      },
      buildWhen: (previousAppState, currentAppState) {
        return currentAppState.navigationCurrentIndex !=
            previousAppState.navigationCurrentIndex;
      },
      builder: (context, appState) {
        debugPrint('AppNavigationRail: BlocConsumer: build()');
        return NavigationRail(
          backgroundColor: theme_data.navigationBackgroundColor,
          labelType: NavigationRailLabelType.all,
          destinations: navigationDestinations.map((e) {
            return NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.label),
            );
          }).toList(),
          selectedIndex: appState.navigationCurrentIndex,
          onDestinationSelected: (selectedIndex) {
            appCubit.onNavigationDestinationSelected(selectedIndex);
          },
        );
      },
    );
  }
}
