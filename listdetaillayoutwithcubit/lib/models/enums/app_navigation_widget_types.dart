import 'package:listdetaillayoutwithcubit/breakpoints.dart';

enum AppNavigationWidgetTypes {
  bar('bar'),
  rail('rail'),
  drawer('drawer');

  final String name;
  const AppNavigationWidgetTypes(this.name);

  bool get isBar => index == 0;
  bool get isRail => index == 1;
  bool get isDrawer => index == 2;

  static AppNavigationWidgetTypes fromWindowWidth(double width) {
    if (width <= compactWindowWidthMax) {
      return AppNavigationWidgetTypes.bar;
    } else if (width <= expandedWindowWidthMax) {
      return AppNavigationWidgetTypes.rail;
    } else {
      return AppNavigationWidgetTypes.drawer;
    }
  }
}
