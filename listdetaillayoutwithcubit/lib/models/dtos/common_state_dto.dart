import 'package:listdetaillayoutwithcubit/models/states/app_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/details_view_selected_item_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/details_view_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_view_items_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayoutwithcubit/models/states/navigation_current_index_state_widget.dart';

class CommonStateDto {
  final AppStateWidget? appState;
  final DetailsViewStateWidget? detailsViewState;
  final ListViewItemsStateWidget? listViewItemsState;
  final ListViewSelectedIndexStateWidget? listViewSelectedIndexState;
  final DetailsViewSelectedItemStateWidget? detailsViewSelectedItemState;
  final NavigationCurrentIndexStateWidget? navigationCurrentIndexState;

  const CommonStateDto({
    this.appState = null,
    this.detailsViewState = null,
    this.listViewItemsState = null,
    this.listViewSelectedIndexState = null,
    this.detailsViewSelectedItemState = null,
    this.navigationCurrentIndexState = null,
  });
}
