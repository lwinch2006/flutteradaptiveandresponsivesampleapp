import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_body_container.dart';
import 'package:listdetaillayout/components/app_header.dart';
import 'package:listdetaillayout/components/app_navigation_bar.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/routes.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.title});

  final String title;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
          pageIndex: addPageIndex,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: addPageIndex,
              )
            : null);
  }
}
