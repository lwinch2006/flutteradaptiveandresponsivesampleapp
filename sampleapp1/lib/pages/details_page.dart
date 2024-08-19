import 'package:flutter/material.dart';
import 'package:sampleapp1/components/body_container.dart';
import 'package:sampleapp1/components/app_navigation_bar.dart';
import 'package:sampleapp1/models/app_navigation_widget_types.dart';
import 'package:sampleapp1/routes.dart';
import 'package:sampleapp1/theme_data.dart' as theme_data;

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
