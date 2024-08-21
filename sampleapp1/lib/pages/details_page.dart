import 'package:flutter/material.dart';
import 'package:sampleapp1/components/app_header.dart';
import 'package:sampleapp1/components/app_navigation_bar.dart';
import 'package:sampleapp1/components/body_container.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/models/app_navigation_widget_types.dart';
import 'package:sampleapp1/routes.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.title});

  final String title;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final currentWindowHeight = MediaQuery.sizeOf(context).height;
    debugPrint(
        'Window size: ${currentWindowWidth.toInt()} x ${currentWindowHeight.toInt()} pixels');
    final navigationWidgetType =
        AppNavigationWidgetTypes.fromWindowWidth(currentWindowWidth);
    return Scaffold(
        appBar: AppHeader(
          appInitState: context.appInitState.value,
          header: widget.title,
          context: context,
        ),
        body: BodyContainer(
          navigationWidgetType: navigationWidgetType,
          pageIndex: detailsPageIndex,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: detailsPageIndex,
              )
            : null);
  }
}
