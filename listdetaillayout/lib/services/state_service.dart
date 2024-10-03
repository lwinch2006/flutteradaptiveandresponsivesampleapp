import 'package:listdetaillayout/models/enums/app_state_types.dart';
import 'package:listdetaillayout/models/enums/details_view_state_types.dart';
import 'package:listdetaillayout/models/states/app_state_widget.dart';
import 'package:listdetaillayout/models/states/details_view_selected_item_state_widget.dart';
import 'package:listdetaillayout/models/states/details_view_state_widget.dart';
import 'package:listdetaillayout/models/states/list_view_items_state_widget.dart';
import 'package:listdetaillayout/models/states/list_view_selected_index_state_widget.dart';
import 'package:listdetaillayout/models/states/navigation_current_index_state_widget.dart';
import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_item_viewmodel.dart';

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
    List<ListItemViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    items.sort((item1, item2) =>
        item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

    listViewItemsState.listViewItems.value =
        List<ListItemViewModel>.from(items);
    listViewItemsState.filteredListViewItems.value =
        List<ListItemViewModel>.from(items);
  }

  void setUnfilteredListViewItemsState(
    ListViewItemsStateWidget? listViewItemsState,
    List<ListItemViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    items.sort((item1, item2) =>
        item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

    listViewItemsState.listViewItems.value = items;
  }

  void setFilteredListViewItemsState(
    ListViewItemsStateWidget? listViewItemsState,
    List<ListItemViewModel> items,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    items.sort((item1, item2) =>
        item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

    listViewItemsState.filteredListViewItems.value = items;
  }

  void setFilterQueryStringState(
    ListViewItemsStateWidget? listViewItemsState,
    String queryString,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    listViewItemsState.filterQueryString.value = queryString;
  }

  void setListViewItemsStateOnListItemUpsert(
    ListViewItemsStateWidget? listViewItemsState,
    int? id,
    ListItemViewModel itemState,
    String filterQueryString,
  ) {
    if (listViewItemsState == null) {
      return;
    }

    if (id == null) {
      _addNewItemToListViewItemsState(
          listViewItemsState, itemState, filterQueryString);
      return;
    }

    if (id < 0) {
      return;
    }

    _updateItemInListViewItemsState(
        listViewItemsState, id, itemState, filterQueryString);

    return;
  }

  void _addNewItemToListViewItemsState(
    ListViewItemsStateWidget listViewItemsState,
    ListItemViewModel itemState,
    String filterQueryString,
  ) {
    final items =
        List<ListItemViewModel>.from(listViewItemsState.listViewItems.value)
          ..add(itemState);
    items.sort((item1, item2) =>
        item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
    listViewItemsState.listViewItems.value = items;

    var filteredItems = List<ListItemViewModel>.from(
        listViewItemsState.filteredListViewItems.value)
      ..add(itemState);

    filteredItems = filteredItems
        .where((item) => item.title.toLowerCase().contains(filterQueryString))
        .toList();

    filteredItems.sort((item1, item2) =>
        item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));

    listViewItemsState.filteredListViewItems.value = filteredItems;
  }

  void _updateItemInListViewItemsState(
    ListViewItemsStateWidget listViewItemsState,
    int id,
    ListItemViewModel itemState,
    String filterQueryString,
  ) {
    var filteredItems = List<ListItemViewModel>.from(
        listViewItemsState.filteredListViewItems.value);
    final filteredItemIndex = filteredItems.indexWhere((item) => item.id == id);

    if (filteredItemIndex >= 0) {
      filteredItems[filteredItemIndex] = itemState;
      filteredItems = filteredItems
          .where((item) => item.title.toLowerCase().contains(filterQueryString))
          .toList();
      filteredItems.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.filteredListViewItems.value = filteredItems;
    }

    final items =
        List<ListItemViewModel>.from(listViewItemsState.listViewItems.value);
    final itemIndex = items.indexWhere((item) => item.id == id);

    if (itemIndex >= 0) {
      items[itemIndex] = itemState;
      items.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));
      listViewItemsState.listViewItems.value = items;
    }
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

  void setDetailsViewSelectedItemState(
    DetailsViewSelectedItemStateWidget? detailsViewSelectedItemState,
    ListItemDetailsViewModel? itemDetails,
  ) {
    if (detailsViewSelectedItemState == null) {
      return;
    }

    detailsViewSelectedItemState.selectedItem.value = itemDetails;
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
    DetailsViewSelectedItemStateWidget? detailsViewSelectedItemState,
  ) {
    if (listViewSelectedIndexState == null ||
        detailsViewSelectedItemState == null) {
      return;
    }

    listViewSelectedIndexState.selectedIndex.value = -2;
    detailsViewSelectedItemState.selectedItem.value =
        const ListItemDetailsViewModel(
      id: null,
      title: '',
      username: '',
      password: '',
    );
  }

  void setNavigationCurrentIndexState(
    NavigationCurrentIndexStateWidget? navigationCurrentIndexState,
    int selectedIndex,
  ) {
    if (navigationCurrentIndexState == null) {
      return;
    }

    navigationCurrentIndexState.currentIndex.value = selectedIndex;
  }
}
