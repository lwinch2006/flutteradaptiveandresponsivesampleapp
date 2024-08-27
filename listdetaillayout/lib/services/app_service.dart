import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/app_adaptive_design_state.dart';
import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/routes.dart' as routes;
import 'package:listdetaillayout/services.dart';

class AppService {
  const AppService();

  Future<void> initApp(BuildContext context) async {
    context.appState.listViewItems.value = await listViewService.getItems();
    context.appState.selectedListViewItemIndex.value = -1;
    context.appState.initStatus.value = true;
    context.go(routes.detailsPagePath);
  }

  void closeApp(BuildContext context) {
    context.appState.listViewItems.value = [];
    context.appState.selectedListViewItemIndex.value = -1;
    context.appState.initStatus.value = false;
    context.go(routes.homePagePath);
  }

  AppAdaptiveDesignState getAppAdaptiveDesignState(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final currentWindowHeight = MediaQuery.sizeOf(context).height;
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(currentWindowWidth);
    final appListDetailLayoutType =
        AppListDetailLayoutTypes.fromWindowWidth(currentWindowWidth);

    debugPrint(
        'Window size: ${currentWindowWidth.toInt()} x ${currentWindowHeight.toInt()} pixels');

    return AppAdaptiveDesignState(
      navigationWidgetType: navigationWidgetType,
      appListDetailLayoutType: appListDetailLayoutType,
    );
  }
}
