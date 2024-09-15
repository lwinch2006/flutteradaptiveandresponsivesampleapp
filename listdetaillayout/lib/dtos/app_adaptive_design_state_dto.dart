import 'package:listdetaillayout/models/app_list_detail_layout_types.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';

final class AppAdaptiveDesignStateDto {
  final AppNavigationWidgetTypes navigationWidgetType;
  final AppListDetailLayoutTypes appListDetailLayoutType;

  const AppAdaptiveDesignStateDto(
      {required this.navigationWidgetType,
      required this.appListDetailLayoutType});
}
