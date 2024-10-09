import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/models/app_navigation_destination.dart';
import 'package:listdetaillayoutwithcubit/pages/home_page.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/list_detail_layout_page.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

const homePageIndex = -1;
const listDetailLayoutPageIndex = 0;

const homePagePath = '/';
const listDetailLayoutPagePath = '/listdetaillayout';

final navigatorKey = GlobalKey<NavigatorState>();

final List<AppNavigationDestination> navigationDestinations =
    <AppNavigationDestination>[
  AppNavigationDestination(
    route: listDetailLayoutPagePath,
    icon: Icons.info_outline,
    label: navigatorKey.currentContext != null
        ? navigatorKey.currentContext!.l10n.navigationDetailsPage
        : 'Accounts',
  ),
  AppNavigationDestination(
    icon: Icons.add,
    label: navigatorKey.currentContext != null
        ? navigatorKey.currentContext!.l10n.navigationAddPage
        : 'Add account',
    action: (Object? listDetailLayoutCubitAsObject) {
      final listDetailLayoutCubit =
          listDetailLayoutCubitAsObject as ListDetailLayoutCubit;
      listDetailLayoutCubit.setAddNewItemState();
    },
  ),
  AppNavigationDestination(
    route: homePagePath,
    icon: Icons.exit_to_app_outlined,
    label: navigatorKey.currentContext != null
        ? navigatorKey.currentContext!.l10n.navigationCloseAppPage
        : 'Close',
  ),
];

GoRouter generateRouter() {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: homePagePath,
    routes: [
      GoRoute(
        path: homePagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: HomePage(title: context.l10n.navigationHomePage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: listDetailLayoutPagePath,
        pageBuilder: (context, state) {
          final listViewItems = state.extra as List<ListItemViewModel>? ??
              List<ListItemViewModel>.empty();

          return CustomTransitionPage(
            child: ListDetailLayoutPage(
              title: context.l10n.navigationDetailsPage,
              listViewItems: listViewItems,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
    ],
  );
}
