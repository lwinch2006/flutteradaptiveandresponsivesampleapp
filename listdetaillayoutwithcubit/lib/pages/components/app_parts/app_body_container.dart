import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/models/enums/app_navigation_widget_types.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_parts/app_user_content_container.dart';
import 'package:listdetaillayoutwithcubit/pages/components/navigation/app_navigation_drawer.dart';
import 'package:listdetaillayoutwithcubit/pages/components/navigation/app_navigation_rail.dart';

class AppBodyContainer extends StatefulWidget {
  final int pageIndex;
  final AppNavigationWidgetTypes navigationWidgetType;
  final Widget? userContent;

  const AppBodyContainer(
      {super.key,
      required this.navigationWidgetType,
      required this.pageIndex,
      this.userContent});

  @override
  State<AppBodyContainer> createState() => _AppBodyContainerState();
}

class _AppBodyContainerState extends State<AppBodyContainer> {
  late Widget? appNavigationWidget = getNavigationWidget();

  Widget? getNavigationWidget() {
    switch (widget.navigationWidgetType) {
      case AppNavigationWidgetTypes.rail:
        return const AppNavigationRail();

      case AppNavigationWidgetTypes.drawer:
        return const AppNavigationDrawer();

      default:
        return null;
    }
  }

  @override
  void didUpdateWidget(covariant AppBodyContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navigationWidgetType == oldWidget.navigationWidgetType &&
        widget.pageIndex == oldWidget.pageIndex) {
      return;
    }
    appNavigationWidget = getNavigationWidget();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AppBodyContainer: build()');
    return Container(
      child: Row(
        children: [
          if (appNavigationWidget != null) appNavigationWidget!,
          Expanded(
            child: AppUserContentContainer(child: widget.userContent),
          ),
        ],
      ),
    );
  }
}
