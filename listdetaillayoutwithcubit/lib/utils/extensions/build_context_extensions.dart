import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/models/dtos/app_adaptive_design_state_dto.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_list_detail_layout_types.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_navigation_widget_types.dart';
import 'package:listdetaillayoutwithcubit/models/states/app_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/details_view_selected_item_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/details_view_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_view_items_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/navigation_current_index_state_widget.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtentions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  AppStateWidget get appState => AppStateWidget.of(this);

  ListViewItemsStateWidget get listViewItemsState =>
      ListViewItemsStateWidget.of(this);

  ListViewSelectedIndexStateWidget? get listViewSelectedIndexState =>
      ListViewSelectedIndexStateWidget.of(this);

  DetailsViewSelectedItemStateWidget? get detailsViewSelectedItemState =>
      DetailsViewSelectedItemStateWidget.of(this);

  DetailsViewStateWidget? get detailsViewState =>
      DetailsViewStateWidget.of(this);

  NavigationCurrentIndexStateWidget get navigationCurrentIndexState =>
      NavigationCurrentIndexStateWidget.of(this);

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
