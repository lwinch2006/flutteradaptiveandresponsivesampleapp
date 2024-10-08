import 'package:flutter/material.dart';
import 'package:sampleapp1/components/app_header.dart';
import 'package:sampleapp1/components/app_navigation_bar.dart';
import 'package:sampleapp1/components/body_container.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/models/app_navigation_widget_types.dart';
import 'package:sampleapp1/routes.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key, required this.title});

  final String title;

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final currentWindowHeight = MediaQuery.sizeOf(context).height;
    debugPrint('${currentWindowWidth}x${currentWindowHeight}');
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
          pageIndex: deletePageIndex,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: deletePageIndex,
              )
            : null);
  }
}
