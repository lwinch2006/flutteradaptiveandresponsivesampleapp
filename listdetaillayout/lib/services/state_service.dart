import 'package:listdetaillayout/models/app_state_types.dart';
import 'package:listdetaillayout/models/details_view_state_types.dart';
import 'package:listdetaillayout/states/app_state_widget.dart';
import 'package:listdetaillayout/states/details_view_state_widget.dart';
import 'package:listdetaillayout/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/states/list_view_selected_item_state_widget.dart';
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_items_viewmodel.dart';

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
    List<ListItemsViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    items.sort((item1, item2) =>
        item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

    listViewItemsState.listViewItems.value = items;
    listViewItemsState.filteredListViewItems.value = items;
  }

  void setFilteredListViewItemsState(
    ListViewItemsStateWidget? listViewItemsState,
    List<ListItemsViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    items.sort((item1, item2) =>
        item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

    listViewItemsState.filteredListViewItems.value = items;
  }

  void setListViewItemState(
    ListViewItemsStateWidget? listViewItemsState,
    int? id,
    ListItemsViewModel itemState,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    if (id == null) {
      final items = listViewItemsState.listViewItems.value..add(itemState);
      items.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.listViewItems.value = items;

      final filteredItems = listViewItemsState.filteredListViewItems.value
        ..add(itemState);
      filteredItems.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.filteredListViewItems.value = filteredItems;

      return;
    }

    if (id < 0) {
      return;
    }

    final filteredItems = List<ListItemsViewModel>.from(
        listViewItemsState.filteredListViewItems.value);
    final filteredItemIndex = filteredItems.indexWhere((item) => item.id == id);

    if (filteredItemIndex >= 0) {
      filteredItems[filteredItemIndex] = itemState;
      filteredItems.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.filteredListViewItems.value = filteredItems;
    }

    final items =
        List<ListItemsViewModel>.from(listViewItemsState.listViewItems.value);
    final itemIndex = items.indexWhere((item) => item.id == id);

    if (itemIndex >= 0) {
      items[itemIndex] = itemState;
      items.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.listViewItems.value = items;
    }

    return;
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
    ListItemDetailsViewModel? itemDetails,
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
    listViewSelectedItemState.selectedItem.value =
        const ListItemDetailsViewModel(
      id: null,
      title: 'New Account',
      username: '',
      password: '',
    );
  }
}
