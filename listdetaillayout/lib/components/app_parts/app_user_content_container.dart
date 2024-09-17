import 'package:flutter/material.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class AppUserContentContainer extends StatelessWidget {
  final Widget? child;
  const AppUserContentContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    debugPrint('AppUserContentContainer: build()');
    return Padding(
      padding: const EdgeInsets.only(
        left: theme_data.commonPaddingValue,
        top: 0.0,
        right: theme_data.commonPaddingValue,
        bottom: theme_data.commonPaddingValue,
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
