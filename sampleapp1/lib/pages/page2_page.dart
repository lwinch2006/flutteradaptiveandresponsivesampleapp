import 'package:flutter/material.dart';
import 'package:sampleapp1/components/body_container.dart';
import 'package:sampleapp1/components/app_navigation_bar.dart';
import 'package:sampleapp1/models/app_navigation_widget_types.dart';
import 'package:sampleapp1/routes.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final navigationWidgetType = AppNavigationWidgetTypes.fromWindowWidth(currentWindowWidth);
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: kDefaultFontSize),
          ),
          centerTitle: false,
        ),
        body: BodyContainer(
          navigationWidgetType: navigationWidgetType,
          pageIndex: page2Index,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: page2Index,
              )
            : null);
  }
}
