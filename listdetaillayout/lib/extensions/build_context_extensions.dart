import 'package:flutter/material.dart';
import 'package:listdetaillayout/extensions/build_context_extensions.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/states/details_view_state_widget.dart';
import 'package:listdetaillayout/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_item_state_widget.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtentions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  AppStateWidget get appState => AppStateWidget.of(this);
  ListViewItemsStateWidget get listViewItemsState =>
      ListViewItemsStateWidget.of(this);
  ListViewSelectedIndexStateWidget? get listViewSelectedIndexState =>
      ListViewSelectedIndexStateWidget.of(this);
  ListViewSelectedItemStateWidget? get listViewSelectedItemState =>
      ListViewSelectedItemStateWidget.of(this);
  DetailsViewStateWidget? get detailsViewState =>
      DetailsViewStateWidget.of(this);
}
