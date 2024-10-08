import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/models/app_navigation_destination.dart';
import 'package:sampleapp1/pages/details_page.dart';
import 'package:sampleapp1/pages/add_page.dart';
import 'package:sampleapp1/pages/edit_page.dart';
import 'package:sampleapp1/pages/delete_page.dart';
import 'package:sampleapp1/pages/home_page.dart';

const detailsPageIndex = 0;
const addPageIndex = 1;
const editPageIndex = 2;
const deletePageIndex = 3;

const homePagePath = '/';
const detailsPagePath = '/details';
const addPagePath = '/add';
const editPagePath = '/edit';
const deletePagePath = '/delete';

final navigatorKey = GlobalKey<NavigatorState>();

final List<AppNavigationDestination> navigationDestinations =
    <AppNavigationDestination>[
  AppNavigationDestination(
      route: detailsPagePath, icon: Icons.info_outline, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationDetailsPage : 'Details'),
  AppNavigationDestination(
      route: addPagePath, icon: Icons.add, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationAddPage : 'Add'),
  AppNavigationDestination(
      route: editPagePath, icon: Icons.edit, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationEditPage : 'Edit'),
  AppNavigationDestination(
      route: deletePagePath, icon: Icons.delete_outline, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationDeletePage : 'Delete'),
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
        path: detailsPagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: DetailsPage(title: context.l10n.navigationDetailsPage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: addPagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: AddPage(title: context.l10n.navigationAddPage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: editPagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: EditPage(title: context.l10n.navigationEditPage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: deletePagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: DeletePage(title: context.l10n.navigationDeletePage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
    ],
  );
}
