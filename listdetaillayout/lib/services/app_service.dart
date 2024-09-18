import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/dtos/app_adaptive_design_state_dto.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/models/app_state_types.dart';
import 'package:listdetaillayout/routes.dart' as routes;
import 'package:listdetaillayout/services/list_detail_layout_service.dart';
import 'package:listdetaillayout/services/state_service.dart';

class AppService {
  final ListDetailLayoutService listDetailLayoutService;
  final StateService stateService;

  const AppService({
    required this.listDetailLayoutService,
    required this.stateService,
  });

  Future<void> initApp(
    BuildContext context,
    CommonStateDto commonState,
  ) async {
    stateService.setAppState(commonState.appState, AppStateTypes.initializing);
    await listDetailLayoutService.getItems(commonState);
    stateService.setAppState(commonState.appState, AppStateTypes.initialized);
    context.go(routes.listDetailLayoutPagePath);
  }

  void closeApp(
    BuildContext context,
    CommonStateDto commonState,
  ) {
    stateService.setListViewSelectedIndexState(
        commonState.listViewSelectedIndexState, -1);
    stateService.setListViewSelectedItemState(
        commonState.listViewSelectedItemState, null);
    stateService.setListViewItemsState(commonState.listViewItemsState, []);
    stateService.setAppState(
        commonState.appState, AppStateTypes.notInitialized);

    context.go(routes.homePagePath);
  }

  AppAdaptiveDesignStateDto getAppAdaptiveDesignState(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final currentWindowHeight = MediaQuery.sizeOf(context).height;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(currentWindowWidth);
    final appListDetailLayoutType =
        AppListDetailLayoutTypes.fromWindowWidth(currentWindowWidth);

    debugPrint(
        'Window size: ${currentWindowWidth.toInt()} x ${currentWindowHeight.toInt()} pixels');
    debugPrint('Pixel ratio: $devicePixelRatio');

    // formWidth = min(currentWindowWidth * 0.8, maxFormWidth);

    return AppAdaptiveDesignStateDto(
      navigationWidgetType: navigationWidgetType,
      appListDetailLayoutType: appListDetailLayoutType,
    );
  }
}
