import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtentions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  AppStateWidget get appState => AppStateWidget.of(this);
}
