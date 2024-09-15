import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/app_navigation_destination.dart';
import 'package:listdetaillayout/pages/home_page.dart';
import 'package:listdetaillayout/pages/list_detail_layout_page.dart';
import 'package:listdetaillayout/services.dart';

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
    action: (BuildContext context, CommonStateDto commonState) {
      navigationService.onAddSelected(commonState);
    },
  ),
  AppNavigationDestination(
      icon: Icons.exit_to_app_outlined,
      label: navigatorKey.currentContext != null
          ? navigatorKey.currentContext!.l10n.navigationCloseAppPage
          : 'Close',
      action: (BuildContext context, CommonStateDto commonState) {
        navigationService.onCloseSelected(context, commonState);
      }),
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
          return CustomTransitionPage(
            child:
                ListDetailLayoutPage(title: context.l10n.navigationDetailsPage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
    ],
  );
}
