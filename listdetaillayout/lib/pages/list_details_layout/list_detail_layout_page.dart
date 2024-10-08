import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/enums/details_view_state_types.dart';
import 'package:listdetaillayout/models/states/details_view_selected_item_state_widget.dart';
import 'package:listdetaillayout/models/states/details_view_state_widget.dart';
import 'package:listdetaillayout/models/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/pages/components/app_parts/app_body_container.dart';
import 'package:listdetaillayout/pages/components/app_parts/app_header.dart';
import 'package:listdetaillayout/pages/components/navigation/app_navigation_bar.dart';
import 'package:listdetaillayout/pages/list_details_layout/components/list_details_layout/list_details_layout.dart';
import 'package:listdetaillayout/routes.dart';
import 'package:listdetaillayout/services.dart';
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';

class ListDetailLayoutPage extends StatefulWidget {
  final String title;
  const ListDetailLayoutPage({super.key, required this.title});

  @override
  State<ListDetailLayoutPage> createState() => _ListDetailLayoutPageState();
}

class _ListDetailLayoutPageState extends State<ListDetailLayoutPage> {
  final selectedItemIndexValueNotifier = ValueNotifier(-1);
  final itemDetailsValueNotifier =
      ValueNotifier(null as ListItemDetailsViewModel?);
  final detailsViewState = ValueNotifier(DetailsViewStateTypes.loadedData);
  final detailsViewError = ValueNotifier(null);

  @override
  void dispose() {
    selectedItemIndexValueNotifier.dispose();
    itemDetailsValueNotifier.dispose();
    detailsViewState.dispose();
    detailsViewError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ListDetailLayoutPage: build()');
    var appAdaptiveDesignState = appService.getAppAdaptiveDesignState(context);

    return ListViewSelectedIndexStateWidget(
      selectedIndex: selectedItemIndexValueNotifier,
      child: DetailsViewSelectedItemStateWidget(
        selectedItem: itemDetailsValueNotifier,
        child: DetailsViewStateWidget(
          state: detailsViewState,
          error: detailsViewError,
          child: Scaffold(
            appBar: AppHeader(
              header: widget.title,
              context: context,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  debugPrint('ListDetailLayoutPage: LayoutBuilder: build()');
                  appAdaptiveDesignState = appService
                      .getAppAdaptiveDesignStateFromBoxConstraints(constraints);

                  return AppBodyContainer(
                    navigationWidgetType:
                        appAdaptiveDesignState.navigationWidgetType,
                    pageIndex: listDetailLayoutPageIndex,
                    userContent: ListDetailsLayout(
                      appListDetailLayoutType:
                          appAdaptiveDesignState.appListDetailLayoutType,
                    ),
                  );
                },
              ),
            ),
            bottomNavigationBar:
                appAdaptiveDesignState.navigationWidgetType.isBar
                    ? const AppNavigationBar()
                    : const SizedBox(height: 20.0),
          ),
        ),
      ),
    );
  }
}
