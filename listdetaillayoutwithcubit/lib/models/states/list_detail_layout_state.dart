import 'package:listdetaillayoutwithcubit/models/enums/details_view_state_types.dart';
import 'package:listdetaillayoutwithcubit/models/nullable.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';

class ListDetailLayoutState {
  final List<ListItemViewModel> listViewItems;
  final List<ListItemViewModel> filteredListViewItems;
  final String filterQueryString;

  final int listViewSelectedIndex;
  final ListItemDetailsViewModel? detailViewSelectedItem;
  final DetailsViewStateTypes detailViewState;
  final String? detailViewStateError;

  const ListDetailLayoutState({
    required this.listViewItems,
    required this.filteredListViewItems,
    required this.filterQueryString,
    required this.listViewSelectedIndex,
    required this.detailViewSelectedItem,
    required this.detailViewState,
    required this.detailViewStateError,
  });

  ListDetailLayoutState copyWith({
    List<ListItemViewModel>? listViewItems,
    List<ListItemViewModel>? filteredListViewItems,
    String? filterQueryString,
    int? listViewSelectedIndex,
    Nullable<ListItemDetailsViewModel>? detailViewSelectedItem,
    DetailsViewStateTypes? detailViewState,
    Nullable<String>? detailViewStateError,
  }) {
    return ListDetailLayoutState(
      listViewItems: listViewItems ?? this.listViewItems,
      filteredListViewItems:
          filteredListViewItems ?? this.filteredListViewItems,
      filterQueryString: filterQueryString ?? this.filterQueryString,
      listViewSelectedIndex:
          listViewSelectedIndex ?? this.listViewSelectedIndex,
      detailViewSelectedItem: detailViewSelectedItem != null
          ? detailViewSelectedItem.value
          : this.detailViewSelectedItem,
      detailViewState: detailViewState ?? this.detailViewState,
      detailViewStateError: detailViewStateError != null
          ? detailViewStateError.value
          : this.detailViewStateError,
    );
  }
}
