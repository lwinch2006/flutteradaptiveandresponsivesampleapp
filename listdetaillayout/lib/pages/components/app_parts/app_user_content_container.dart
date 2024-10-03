import 'package:flutter/material.dart';

class AppUserContentContainer extends StatelessWidget {
  final Widget? child;
  const AppUserContentContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppUserContentContainer: build()');
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 0.0,
        right: 20.0,
        bottom: 0.0,
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
