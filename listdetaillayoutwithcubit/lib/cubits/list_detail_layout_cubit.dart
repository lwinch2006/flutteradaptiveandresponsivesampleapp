import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listdetaillayoutwithcubit/application/services/ilist_detail_service.dart';
import 'package:listdetaillayoutwithcubit/models/enums/details_view_state_types.dart';
import 'package:listdetaillayoutwithcubit/models/nullable.dart';
import 'package:listdetaillayoutwithcubit/models/states/list_detail_layout_state.dart';
import 'package:listdetaillayoutwithcubit/utils/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayoutwithcubit/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/update_list_item_viewmodel.dart';

class ListDetailLayoutCubit extends Cubit<ListDetailLayoutState> {
  final IListDetailService listDetailService;

  ListDetailLayoutCubit({
    required this.listDetailService,
    required List<ListItemViewModel> listViewItems,
  }) : super(ListDetailLayoutState(
          listViewItems: listViewItems
            ..sort((item1, item2) =>
                item1.title.toUpperCase().compareTo(item2.title.toUpperCase())),
          filteredListViewItems: listViewItems,
          filterQueryString: "",
          listViewSelectedIndex: -1,
          detailViewSelectedItem: null,
          detailViewState: DetailsViewStateTypes.loadedData,
          detailViewStateError: null,
        ));

  Future<void> onListTileTap(int selectedIndex) async {
    try {
      debugPrint('Selected list view item index: $selectedIndex');

      emit(state.copyWith(listViewSelectedIndex: selectedIndex));

      final detailViewSelectedItem = state.detailViewSelectedItem;
      final listViewSelectedItem = selectedIndex >= 0
          ? state.filteredListViewItems[selectedIndex]
          : null;

      if (!(detailViewSelectedItem?.id == listViewSelectedItem?.id)) {
        if (listViewSelectedItem != null) {
          emit(state.copyWith(
            detailViewSelectedItem: const Nullable(null),
            detailViewState: DetailsViewStateTypes.loadingData,
          ));

          final listItemDetails = await listDetailService.getItemDetails(
              listViewSelectedItem.id, listViewSelectedItem.title);

          final listItemDetailsViewModel = ListDetailLayoutMapper
              .MapToDetailViewViewModelFromListItemDetails(listItemDetails);

          emit(state.copyWith(
              detailViewState: DetailsViewStateTypes.loadedData,
              detailViewSelectedItem: Nullable(listItemDetailsViewModel)));
        }
      }
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      emit(state.copyWith(
        detailViewState: DetailsViewStateTypes.loadingDataError,
        detailViewStateError: const Nullable('Loading data failed'),
      ));
    }

    return;
  }

  Future<void> closeItemDetails() async {
    try {
      emit(state.copyWith(
        listViewSelectedIndex: -1,
        detailViewSelectedItem: const Nullable(null),
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }

    return;
  }

  Future<void> searchItems(String queryString) async {
    try {
      final filteredItems = state.listViewItems
          .where((item) => item.title.toLowerCase().contains(queryString))
          .toList();

      emit(state.copyWith(
        filterQueryString: queryString,
        filteredListViewItems: filteredItems,
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }

    return;
  }

  Future<void> clearSearch() async {
    try {
      final items = List<ListItemViewModel>.from(state.listViewItems);

      emit(state.copyWith(
        filterQueryString: "",
        filteredListViewItems: items,
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }

    return;
  }

  void setAddNewItemState() {
    emit(state.copyWith(
      listViewSelectedIndex: -2,
      detailViewSelectedItem: const Nullable(
        ListItemDetailsViewModel(
          id: null,
          title: '',
          username: '',
          password: '',
        ),
      ),
    ));

    return;
  }

  Future<void> createNewItem(
      CreateNewListItemViewModel createNewListItemViewModel) async {
    try {
      debugPrint('list item details getting added');
      emit(state.copyWith(detailViewState: DetailsViewStateTypes.addingData));

      final command = ListDetailLayoutMapper.MapToCreateNewListItemCommand(
          createNewListItemViewModel)!;

      final newId = await listDetailService.createNewItem(command);

      final detailsViewViewModel = ListDetailLayoutMapper
          .MapToDetailViewViewModelFromCreateNewListItemViewModel(
              newId, createNewListItemViewModel);

      final listItemViewModel =
          ListDetailLayoutMapper.MapToListViewViewModelFromDetailViewViewModel(
              detailsViewViewModel)!;

      _upsertNewItemToListViewItemsState(
        null,
        listItemViewModel,
      );

      final indexOfNewListViewItem =
          state.filteredListViewItems.indexOf(listItemViewModel);

      emit(state.copyWith(
        detailViewState: DetailsViewStateTypes.loadedData,
        listViewSelectedIndex: indexOfNewListViewItem,
        detailViewSelectedItem: indexOfNewListViewItem > 0
            ? Nullable(detailsViewViewModel)
            : const Nullable(null),
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }

    return;
  }

  Future<void> updateItem(
      UpdateListItemViewModel updateListItemViewModel) async {
    try {
      debugPrint('list item details getting updated');
      emit(state.copyWith(detailViewState: DetailsViewStateTypes.updatingData));

      final command = ListDetailLayoutMapper.MapToUpdateListItemCommand(
          updateListItemViewModel)!;

      await listDetailService.updateItem(command);

      final listItemDetailsViewModel = ListDetailLayoutMapper
          .MapToDetailViewViewModelFromUpdateListItemViewModel(
              updateListItemViewModel);

      final listItemViewModel =
          ListDetailLayoutMapper.MapToListViewViewModelFromDetailViewViewModel(
              listItemDetailsViewModel)!;

      final indexOfNewListViewItem =
          state.filteredListViewItems.indexOf(listItemViewModel);

      _upsertNewItemToListViewItemsState(
          listItemViewModel.id, listItemViewModel);

      emit(state.copyWith(
        listViewSelectedIndex: indexOfNewListViewItem,
        detailViewSelectedItem: Nullable(
            indexOfNewListViewItem >= 0 ? listItemDetailsViewModel : null),
        detailViewState: DetailsViewStateTypes.loadedData,
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> deleteItem(int itemId) async {
    try {
      debugPrint('list item details getting deleted');

      final command = ListDetailLayoutMapper.MapToDeleteListItemCommand(itemId);

      await listDetailService.deleteItem(command);

      final unfilteredListViewItemsExceptDeleted =
          List<ListItemViewModel>.from(state.listViewItems)
              .where((item) => item.id != itemId)
              .toList();

      unfilteredListViewItemsExceptDeleted.sort((item1, item2) =>
          item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

      final filteredListViewItemsExceptDeleted =
          List<ListItemViewModel>.from(state.filteredListViewItems)
              .where((item) => item.id != itemId)
              .toList();

      filteredListViewItemsExceptDeleted.sort((item1, item2) =>
          item1.title.toUpperCase().compareTo(item2.title.toUpperCase()));

      emit(state.copyWith(
        listViewItems: unfilteredListViewItemsExceptDeleted,
        filteredListViewItems: filteredListViewItemsExceptDeleted,
        listViewSelectedIndex: -1,
        detailViewSelectedItem: null,
      ));
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }
  }

  void resetSelectedIndexAndSelectedItem() {
    emit(state.copyWith(
        listViewSelectedIndex: -1,
        detailViewSelectedItem: const Nullable(null)));
    return;
  }

  void _upsertNewItemToListViewItemsState(
      int? id, ListItemViewModel itemState) {
    if (id == null) {
      _addNewItemToListViewItemsState(itemState);
      return;
    }

    if (id < 0) {
      return;
    }

    _updateItemInListViewItemsState(id, itemState);

    return;
  }

  void _addNewItemToListViewItemsState(ListItemViewModel newListItemViewModel) {
    final items = List<ListItemViewModel>.from(state.listViewItems)
      ..add(newListItemViewModel);

    items.sort((item1, item2) =>
        item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));

    var filteredItems =
        List<ListItemViewModel>.from(state.filteredListViewItems)
          ..add(newListItemViewModel);

    filteredItems = filteredItems
        .where((item) =>
            item.title.toLowerCase().contains(state.filterQueryString))
        .toList();

    filteredItems.sort((item1, item2) =>
        item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));

    emit(state.copyWith(
      listViewItems: items,
      filteredListViewItems: filteredItems,
    ));
  }

  void _updateItemInListViewItemsState(
    int id,
    ListItemViewModel itemState,
  ) {
    var filteredItems =
        List<ListItemViewModel>.from(state.filteredListViewItems);

    final filteredItemIndex = filteredItems.indexWhere((item) => item.id == id);

    if (filteredItemIndex >= 0) {
      filteredItems[filteredItemIndex] = itemState;
      filteredItems = filteredItems
          .where((item) =>
              item.title.toLowerCase().contains(state.filterQueryString))
          .toList();
      filteredItems.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));

      emit(state.copyWith(filteredListViewItems: filteredItems));
    }

    final items = List<ListItemViewModel>.from(state.listViewItems);
    final itemIndex = items.indexWhere((item) => item.id == id);

    if (itemIndex >= 0) {
      items[itemIndex] = itemState;
      items.sort((item1, item2) =>
          item1.title.toLowerCase().compareTo(item2.title.toLowerCase()));

      emit(state.copyWith(listViewItems: items));
    }
  }
}
