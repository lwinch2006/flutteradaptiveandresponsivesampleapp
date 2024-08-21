import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_navigation_drawer.dart';
import 'package:listdetaillayout/components/app_navigation_rail.dart';
import 'package:listdetaillayout/components/user_content_container.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class BodyContainer extends StatelessWidget {
  final int pageIndex;
  final AppNavigationWidgetTypes navigationWidgetType;
  final Widget? userContent;

  const BodyContainer(
      {super.key,
      required this.navigationWidgetType,
      required this.pageIndex,
      this.userContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme_data.bodyBackGroundColor,
      child: SafeArea(
        child: Row(
          children: [
            if (navigationWidgetType.isRail)
              AppNavigationRail(currentIndex: pageIndex),
            if (navigationWidgetType.isDrawer)
              AppNavigationDrawer(currentIndex: pageIndex),
            Expanded(
              child: UserContentContainer(child: userContent),
            ),
          ],
        ),
      ),
    );
  }
}
