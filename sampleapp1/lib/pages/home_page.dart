import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sampleapp1/routes.dart' as routes;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surfaceContainerLow,
        title: Text(
          widget.title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: kDefaultFontSize),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: FilledButton(
            onPressed: () {
              context.go(routes.detailsPagePath);
            },
            child: const Text('Start')),
      ),
    );
  }

}