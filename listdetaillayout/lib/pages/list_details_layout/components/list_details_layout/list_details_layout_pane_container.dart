import 'package:flutter/material.dart';
import 'package:listdetaillayout/theme_data.dart' as theme_data;

class ListDetailsLayoutPaneContainer extends StatelessWidget {
  final Widget? child;

  const ListDetailsLayoutPaneContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme_data.userContentBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(theme_data.commonPaddingValue),
        child: child,
      ),
    );
  }
}
