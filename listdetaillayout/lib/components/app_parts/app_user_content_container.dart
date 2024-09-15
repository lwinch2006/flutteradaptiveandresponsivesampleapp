import 'package:flutter/material.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppUserContentContainer extends StatelessWidget {
  final Widget? child;
  const AppUserContentContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppUserContentContainer: build()');
    return Padding(
      padding: theme_data.commonPadding,
      child: Container(
        decoration: BoxDecoration(
            color: theme_data.userContentBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: child,
      ),
    );
  }
}
