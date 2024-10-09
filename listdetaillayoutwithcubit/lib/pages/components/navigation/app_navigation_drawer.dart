import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayoutwithcubit/cubits/app_cubit.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state.dart';
import 'package:listdetaillayoutwithcubit/routes.dart';
import 'package:listdetaillayoutwithcubit/theme_data.dart' as theme_data;

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({super.key});

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
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
    debugPrint('AppNavigationDrawer: build()');
    return SizedBox(
      width: 200.0,
      child: BlocConsumer<AppCubit, AppState>(
        listenWhen: (previousAppState, currentAppState) {
          return currentAppState.navigationCurrentIndex !=
              previousAppState.navigationCurrentIndex;
        },
        listener: (context, appState) {
          debugPrint('AppNavigationDrawer: BlocConsumer: listener()');

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
          debugPrint('AppNavigationDrawer: BlocConsumer: build()');
          return NavigationDrawer(
            selectedIndex: appState.navigationCurrentIndex,
            backgroundColor: theme_data.navigationBackgroundColor,
            tilePadding: const EdgeInsetsDirectional.symmetric(vertical: 0.0),
            children: navigationDestinations.map((e) {
              return NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.label),
              );
            }).toList(),
            onDestinationSelected: (selectedIndex) {
              appCubit.onNavigationDestinationSelected(selectedIndex);
            },
          );
        },
      ),
    );
  }
}
