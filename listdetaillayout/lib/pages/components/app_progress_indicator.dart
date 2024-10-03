import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final String label;
  const AppProgressIndicator({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: 10.0,
          ),
          Text(label),
        ],
      ),
    );
  }
}
