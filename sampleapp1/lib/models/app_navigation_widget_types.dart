import 'package:sampleapp1/breakpoints.dart';

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
    if (width < mediumWindowWidthMin) {
      return AppNavigationWidgetTypes.bar;
    } else if (width < mediumWindowWidthMax) {
      return AppNavigationWidgetTypes.rail;
    } else {
      return AppNavigationWidgetTypes.drawer;
    }
  }
}