import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_parts/app_body_container.dart';
import 'package:listdetaillayout/components/app_parts/app_header.dart';
import 'package:listdetaillayout/components/navigation/app_navigation_bar.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/routes.dart';

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
          showCloseButton: true,
          header: widget.title,
          context: context,
        ),
        body: AppBodyContainer(
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
