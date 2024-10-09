import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/models/dtos/app_adaptive_design_state_dto.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_list_detail_layout_types.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_navigation_widget_types.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtentions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  AppAdaptiveDesignStateDto getAppAdaptiveDesignState() {
    final currentWindowSize = MediaQuery.sizeOf(this);
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(this);
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
}
