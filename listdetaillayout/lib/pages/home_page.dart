import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_header.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/services/app_service.dart';

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
      appBar: AppHeader(
        appInitState: context.appInitState.value,
        header: widget.title,
        context: context,
      ),
      body: Center(
        child: FilledButton(
            onPressed: () => AppService()..appInit(context),
            child: const Text('Start')),
      ),
    );
  }
}
