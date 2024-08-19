import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/models/app_navigation_destination.dart';
import 'package:sampleapp1/pages/home_page.dart';
import 'package:sampleapp1/pages/page1_page.dart';
import 'package:sampleapp1/pages/page2_page.dart';
import 'package:sampleapp1/pages/page3_page.dart';

const homePageIndex = 0;
const page1Index = 1;
const page2Index = 2;
const page3Index = 3;

const homePagePath = '/';
const page1Path = '/page1';
const page2Path = '/page2';
const page3Path = '/page3';

final navigatorKey = GlobalKey<NavigatorState>();

final List<AppNavigationDestination> navigationDestinations =
    <AppNavigationDestination>[
  AppNavigationDestination(
      route: homePagePath, icon: Icons.info_outline, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationDetailsPageFirstCapital : 'Details'),
  AppNavigationDestination(
      route: page1Path, icon: Icons.add, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationAddPageFirstCapital : 'Add'),
  AppNavigationDestination(
      route: page2Path, icon: Icons.edit, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationEditPageFirstCapital : 'Edit'),
  AppNavigationDestination(
      route: page3Path, icon: Icons.delete_outline, label: navigatorKey.currentContext != null ? navigatorKey.currentContext!.l10n.navigationDeletePageFirstCapital : 'Delete'),
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
            child: HomePage(title: '${context.l10n.navigationDetailsPageFirstCapital} ${context.l10n.page}'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: page1Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: Page1(title: '${context.l10n.navigationAddPageFirstCapital} ${context.l10n.page}'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: page2Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: Page2(title: '${context.l10n.navigationEditPageFirstCapital} ${context.l10n.page}'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
      GoRoute(
        path: page3Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: Page3(title: '${context.l10n.navigationDeletePageFirstCapital} ${context.l10n.page}'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          );
        },
      ),
    ],
  );
}
