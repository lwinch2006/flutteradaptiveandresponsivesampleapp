import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_body_container.dart';
import 'package:listdetaillayout/components/app_header.dart';
import 'package:listdetaillayout/components/app_list_detail_layout.dart';
import 'package:listdetaillayout/components/app_navigation_bar.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final appAdaptiveDesignState =
        appService.getAppAdaptiveDesignState(context);

    return Scaffold(
        appBar: AppHeader(
          showCloseButton: true,
          header: widget.title,
          context: context,
        ),
        body: AppBodyContainer(
          navigationWidgetType: appAdaptiveDesignState.navigationWidgetType,
          pageIndex: detailsPageIndex,
          userContent: AppListDetailLayout(
              appListDetailLayoutType:
                  appAdaptiveDesignState.appListDetailLayoutType),
        ),
        bottomNavigationBar: appAdaptiveDesignState.navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: detailsPageIndex,
              )
            : null);
  }
}
