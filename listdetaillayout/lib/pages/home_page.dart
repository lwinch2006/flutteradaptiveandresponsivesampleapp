import 'package:flutter/material.dart';
import 'package:listdetaillayout/components/app_center_text.dart';
import 'package:listdetaillayout/components/app_header.dart';
import 'package:listdetaillayout/components/app_progress_indicator.dart';
import 'package:listdetaillayout/services.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void>? appInitResult = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        showCloseButton: false,
        header: widget.title,
        centerHeader: true,
        context: context,
      ),
      body: appInitResult == null
          ? Center(
              child: FilledButton(
                  onPressed: () {
                    setState(() {
                      appInitResult = appService.initApp(context);
                    });
                  },
                  child: const Text('Start')),
            )
          : FutureBuilder(
              future: appInitResult,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError) {
                  return const AppCenterText(data: 'Operation failed');
                }

                return const AppProgressIndicator();
              },
            ),
    );
  }
}
