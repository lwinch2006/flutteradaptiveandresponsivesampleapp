import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services/app_service.dart';
import 'package:listdetaillayout/services/list_detail_layout_service.dart';
import 'package:listdetaillayout/services/state_service.dart';

class NavigationService {
  final AppService appService;
  final ListDetailLayoutService listDetailLayoutService;
  final StateService stateService;

  const NavigationService({
    required this.appService,
    required this.listDetailLayoutService,
    required this.stateService,
  });

  void onDestinationSelected(
    BuildContext context,
    CommonStateDto commonState,
    int selectedIndex,
  ) {
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;

    final navigationCurrentIndexState =
        commonState.navigationCurrentIndexState!;

    final listViewSelectedItemState = commonState.listViewSelectedItemState;

    if (navigationCurrentIndexState.currentIndex.value == selectedIndex) {
      return;
    }

    stateService.setNavigationCurrentIndexState(
        navigationCurrentIndexState, selectedIndex);

    stateService.setListViewSelectedIndexState(listViewSelectedIndexState, -1);
    stateService.setListViewSelectedItemState(listViewSelectedItemState, null);

    if (navigationDestinations[selectedIndex].action != null) {
      navigationDestinations[selectedIndex].action!(context, commonState);
    } else {
      context.go(navigationDestinations[selectedIndex].route!);
    }
  }

  void onAddSelected(CommonStateDto commonState) {
    stateService.setAddNewItemState(
      commonState.listViewSelectedIndexState,
      commonState.listViewSelectedItemState,
    );
  }

  void onCloseSelected(BuildContext context, CommonStateDto commonState) {
    appService.closeApp(context, commonState);
  }
}
