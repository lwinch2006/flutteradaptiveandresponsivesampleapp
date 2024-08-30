import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_parts/app_body_container.dart';
import 'package:listdetaillayout/components/app_parts/app_header.dart';
import 'package:listdetaillayout/components/list_detail_layout/app_list_detail_layout.dart';
import 'package:listdetaillayout/components/navigation/app_navigation_bar.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/states/list_item_select_state_widget.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final selectedItemIndexValueNotifier = ValueNotifier(-1);
  final itemDetailsValueNotifier = ValueNotifier(null as DetailViewViewModel?);

  @override
  void dispose() {
    selectedItemIndexValueNotifier.dispose();
    itemDetailsValueNotifier.dispose();
    super.dispose();
  }

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
          userContent: ListItemSelectStateWidget(
            child: AppListDetailLayout(
                appListDetailLayoutType:
                    appAdaptiveDesignState.appListDetailLayoutType),
            selectedItemIndex: selectedItemIndexValueNotifier,
            itemDetails: itemDetailsValueNotifier,
          ),
        ),
        bottomNavigationBar: appAdaptiveDesignState.navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: detailsPageIndex,
              )
            : null);
  }
}
