import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/states/details_view_state_widget.dart';
import 'package:listdetaillayout/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_item_state_widget.dart';
import 'package:listdetaillayout/states/navigation_current_index_state_widget.dart';

class CommonStateDto {
  final AppStateWidget? appState;
  final DetailsViewStateWidget? detailsViewState;
  final ListViewItemsStateWidget? listViewItemsState;
  final ListViewSelectedIndexStateWidget? listViewSelectedIndexState;
  final ListViewSelectedItemStateWidget? listViewSelectedItemState;
  final NavigationCurrentIndexStateWidget? navigationCurrentIndexState;

  const CommonStateDto({
    this.appState = null,
    this.detailsViewState = null,
    this.listViewItemsState = null,
    this.listViewSelectedIndexState = null,
    this.listViewSelectedItemState = null,
    this.navigationCurrentIndexState = null,
  });
}
