import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/routes.dart' as routes;

class AppService {
  const AppService();

  void appInit(BuildContext context) {
    context.appInitState.value = true;
    context.go(routes.detailsPagePath);
  }

  void appClose(BuildContext context) {
    context.appInitState.value = false;
    context.go(routes.homePagePath);
  }
}
