import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/models/dtos/app_adaptive_design_state_dto.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/models/enums/app_list_detail_layout_types.dart';
import 'package:listdetaillayout/models/enums/app_navigation_widget_types.dart';
import 'package:listdetaillayout/models/enums/app_state_types.dart';
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

    stateService.setNavigationCurrentIndexState(
        commonState.navigationCurrentIndexState,
        routes.listDetailLayoutPageIndex);

    context.go(routes.listDetailLayoutPagePath);
  }

  void closeApp(
    BuildContext context,
    CommonStateDto commonState,
  ) {
    stateService.setListViewSelectedIndexState(
        commonState.listViewSelectedIndexState, -1);
    stateService.setDetailsViewSelectedItemState(
        commonState.detailsViewSelectedItemState, null);
    stateService.setListViewItemsState(commonState.listViewItemsState, []);

    stateService.setAppState(
        commonState.appState, AppStateTypes.notInitialized);

    stateService.setNavigationCurrentIndexState(
        commonState.navigationCurrentIndexState, routes.homePageIndex);

    context.go(routes.homePagePath);
  }

  AppAdaptiveDesignStateDto getAppAdaptiveDesignState(BuildContext context) {
    final currentWindowSize = MediaQuery.sizeOf(context);
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(currentWindowSize.width);
    final appListDetailLayoutType =
        AppListDetailLayoutTypes.fromWindowWidth(currentWindowSize.width);

    debugPrint(
        'Window size (MediaQuery): ${currentWindowSize.width.toInt()} x ${currentWindowSize.height.toInt()} pixels');
    debugPrint('Pixel ratio: $devicePixelRatio');

    return AppAdaptiveDesignStateDto(
      navigationWidgetType: navigationWidgetType,
      appListDetailLayoutType: appListDetailLayoutType,
    );
  }

  AppAdaptiveDesignStateDto getAppAdaptiveDesignStateFromBoxConstraints(
      BoxConstraints constraints) {
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(constraints.maxWidth);
    final appListDetailLayoutType =
        AppListDetailLayoutTypes.fromWindowWidth(constraints.maxWidth);

    debugPrint(
        'Window size (BoxConstrains): ${constraints.maxWidth.toInt()} x ${constraints.maxHeight.toInt()} pixels');

    return AppAdaptiveDesignStateDto(
      navigationWidgetType: navigationWidgetType,
      appListDetailLayoutType: appListDetailLayoutType,
    );
  }
}
