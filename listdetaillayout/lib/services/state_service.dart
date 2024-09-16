import 'package:listdetaillayout/models/app_state_types.dart';
import 'package:listdetaillayout/models/details_view_state_types.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/states/details_view_state_widget.dart';
import 'package:listdetaillayout/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_item_state_widget.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class StateService {
  const StateService();

  void setAppState(
    AppStateWidget? appState,
    AppStateTypes state,
  ) {
    if (appState == null) {
      return;
    }

    appState.state.value = state;
  }

  void setListViewItemsState(
    ListViewItemsStateWidget? listViewItemsState,
    List<ListViewViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    listViewItemsState.listViewItems.value = items;
  }

  void setListViewItemState(
    ListViewItemsStateWidget? listViewItemsState,
    int? index,
    ListViewViewModel itemState,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    if (index == null) {
      listViewItemsState.listViewItems.value =
          List.from(listViewItemsState.listViewItems.value)..add(itemState);

      return;
    }

    if (index < 0 ||
        index > listViewItemsState.listViewItems.value.length - 1) {
      return;
    }

    listViewItemsState.listViewItems.value[index] = itemState;
    listViewItemsState.listViewItems.value =
        List.from(listViewItemsState.listViewItems.value);
  }

  void setListViewSelectedIndexState(
    ListViewSelectedIndexStateWidget? listViewSelectedIndexState,
    int selectedIndex,
  ) {
    if (listViewSelectedIndexState == null) {
      return;
    }

    listViewSelectedIndexState.selectedIndex.value = selectedIndex;
  }

  void setListViewSelectedItemState(
    ListViewSelectedItemStateWidget? listViewSelectedItemState,
    DetailViewViewModel? itemDetails,
  ) {
    if (listViewSelectedItemState == null) {
      return;
    }

    listViewSelectedItemState.selectedItem.value = itemDetails;
  }

  void setDetailsViewState(
    DetailsViewStateWidget? detailsViewState,
    DetailsViewStateTypes state,
  ) {
    if (detailsViewState == null) {
      return;
    }

    detailsViewState.state.value = state;
  }

  void setAddNewItemState(
    ListViewSelectedIndexStateWidget? listViewSelectedIndexState,
    ListViewSelectedItemStateWidget? listViewSelectedItemState,
  ) {
    if (listViewSelectedIndexState == null ||
        listViewSelectedItemState == null) {
      return;
    }

    listViewSelectedIndexState.selectedIndex.value = -2;
    listViewSelectedItemState.selectedItem.value = const DetailViewViewModel(
      itemId: null,
      itemTitle: 'New Account',
      username: '',
      password: '',
    );
  }
}
