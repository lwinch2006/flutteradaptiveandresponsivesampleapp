import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:listdetaillayoutwithcubit/cubits/list_detail_layout_cubit.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_parts/app_body_container.dart';
import 'package:listdetaillayoutwithcubit/pages/components/app_parts/app_header.dart';
import 'package:listdetaillayoutwithcubit/pages/components/navigation/app_navigation_bar.dart';
import 'package:listdetaillayoutwithcubit/pages/list_details_layout/components/list_details_layout/list_details_layout.dart';
import 'package:listdetaillayoutwithcubit/routes.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/box_constraints_extensions.dart';
import 'package:listdetaillayoutwithcubit/utils/extensions/build_context_extensions.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

class ListDetailLayoutPage extends StatefulWidget {
  final String title;
  final List<ListItemViewModel> listViewItems;
  const ListDetailLayoutPage({
    super.key,
    required this.title,
    required this.listViewItems,
  });

  @override
  State<ListDetailLayoutPage> createState() => _ListDetailLayoutPageState();
}

class _ListDetailLayoutPageState extends State<ListDetailLayoutPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('ListDetailLayoutPage: build()');
    var appAdaptiveDesignState = context.getAppAdaptiveDesignState();

    return BlocProvider<ListDetailLayoutCubit>(
      create: (context) => ListDetailLayoutCubit(
        listDetailService: GetIt.I.get(),
        listViewItems: widget.listViewItems,
      ),
      child: Scaffold(
        appBar: AppHeader(
          header: widget.title,
          context: context,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              debugPrint('ListDetailLayoutPage: LayoutBuilder: build()');
              appAdaptiveDesignState =
                  constraints.getAppAdaptiveDesignStateFromBoxConstraints();

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
        bottomNavigationBar: appAdaptiveDesignState.navigationWidgetType.isBar
            ? const AppNavigationBar()
            : const SizedBox(height: 20.0),
      ),
    );
  }
}
