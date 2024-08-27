import 'package:flutter/material.dart';

class AppCenterText extends StatelessWidget {
  final String data;
  const AppCenterText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(data),
    );
  }
}
