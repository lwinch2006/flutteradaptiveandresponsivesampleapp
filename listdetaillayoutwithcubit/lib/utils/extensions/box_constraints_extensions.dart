import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/models/dtos/app_adaptive_design_state_dto.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_list_detail_layout_types.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_navigation_widget_types.dart';

extension BoxConstraintsExtentions on BoxConstraints {
  AppAdaptiveDesignStateDto getAppAdaptiveDesignStateFromBoxConstraints() {
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(this.maxWidth);
    final appListDetailLayoutType =
        AppListDetailLayoutTypes.fromWindowWidth(this.maxWidth);

    debugPrint(
        'Window size (BoxConstrains): ${this.maxWidth.toInt()} x ${this.maxHeight.toInt()} pixels');

    return AppAdaptiveDesignStateDto(
      navigationWidgetType: navigationWidgetType,
      appListDetailLayoutType: appListDetailLayoutType,
    );
  }
}
