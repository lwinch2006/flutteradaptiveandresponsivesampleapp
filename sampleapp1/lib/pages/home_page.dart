import 'package:flutter/material.dart';
import 'package:sampleapp1/components/body_container.dart';
import 'package:sampleapp1/components/app_navigation_bar.dart';
import 'package:sampleapp1/models/app_navigation_widget_types.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWindowWidth = MediaQuery.sizeOf(context).width;
    final navigationWidgetType = AppNavigationWidgetTypes.fromWindowWidth(currentWindowWidth);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme_data.appBarBackgroundColor,
          title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: kDefaultFontSize),
          ),
          centerTitle: false,
        ),
        body: BodyContainer(
          navigationWidgetType: navigationWidgetType,
          pageIndex: homePageIndex,
          userContent: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: navigationWidgetType.isBar
            ? const AppNavigationBar(
                currentIndex: homePageIndex,
              )
            : null);
  }
}
