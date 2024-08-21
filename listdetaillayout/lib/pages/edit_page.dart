import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_header.dart';
import 'package:listdetaillayout/components/app_navigation_bar.dart';
import 'package:listdetaillayout/components/body_container.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/models/app_navigation_widget_types.dart';
import 'package:listdetaillayout/routes.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.title});

  final String title;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
          pageIndex: editPageIndex,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: editPageIndex,
              )
            : null);
  }
}
