import 'package:flutter/material.dart';
import 'package:sampleapp1/extensions/build_context_extensions.dart';
import 'package:sampleapp1/states/app_init_state_widget.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtentions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  ValueNotifier<bool> get appInitState =>
      AppInitStateWidget.of(this).appInitState;
}
