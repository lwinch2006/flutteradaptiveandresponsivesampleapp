import 'package:flutter/material.dart';
import 'package:listdetaillayout/models/dtos/common_state_dto.dart';
import 'package:listdetaillayout/models/enums/details_view_state_types.dart';
import 'package:listdetaillayout/repositories/list_detail_layout_repository.dart';
import 'package:listdetaillayout/routes.dart' as routes;
import 'package:listdetaillayout/services/state_service.dart';
import 'package:listdetaillayout/utils/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayout/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_item_viewmodel.dart';
import 'package:listdetaillayout/view_models/update_list_item_viewmodel.dart';

class ListDetailLayoutService {
  final ListDetailLayoutRepository listDetailLayoutRepository;
  final StateService stateService;

  const ListDetailLayoutService({
    required this.listDetailLayoutRepository,
    required this.stateService,
  });

  Future<List<ListItemViewModel>> getItems(CommonStateDto commonState) {
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;

    final listViewSelectedItemState = commonState.listViewSelectedItemState;

    final listViewItemsState = commonState.listViewItemsState;

    stateService.setListViewSelectedIndexState(listViewSelectedIndexState, -1);
    stateService.setListViewSelectedItemState(listViewSelectedItemState, null);

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        final listItems = await listDetailLayoutRepository.getItems();
        final listItemsAsViewModel =
            ListDetailLayoutMapper.MapToListViewViewModels(listItems);

        stateService.setListViewItemsState(
            listViewItemsState, listItemsAsViewModel);

        return listItemsAsViewModel;
      },
    );
  }

  Future<void> getItemDetails(
    int itemId,
    String itemTitle,
    CommonStateDto commonState,
  ) {
    final detailsViewState = commonState.detailsViewState;
    final listViewSelectedItemState = commonState.listViewSelectedItemState;

    stateService.setDetailsViewState(
      detailsViewState,
      DetailsViewStateTypes.loadingData,
    );

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        final listItemDetails =
            await listDetailLayoutRepository.getItemDetails(itemId);
        final listItemAsViewModel =
            ListDetailLayoutMapper.MapToDetailViewViewModelFromListItemDetails(
                listItemDetails);

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          listItemAsViewModel,
        );
        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> createNewItem(
    CreateNewListItemViewModel createNewListItemViewModel,
    CommonStateDto commonState,
  ) {
    debugPrint('list item details getting added');
    final detailsViewState = commonState.detailsViewState;
    final listViewItemsState = commonState.listViewItemsState!;
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;
    final listViewSelectedItemState = commonState.listViewSelectedItemState;
    final navigationCurrentIndexState = commonState.navigationCurrentIndexState;

    stateService.setDetailsViewState(
        detailsViewState, DetailsViewStateTypes.addingData);

    final command = ListDetailLayoutMapper.MapToCreateNewListItemCommand(
        createNewListItemViewModel)!;

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        var newId = await listDetailLayoutRepository.createItem(command);

        final detailsViewViewModel = ListDetailLayoutMapper
            .MapToDetailViewViewModelFromCreateNewListItemViewModel(
                newId, createNewListItemViewModel);

        final listItemViewModel = ListDetailLayoutMapper
            .MapToListViewViewModelFromDetailViewViewModel(
                detailsViewViewModel)!;

        stateService.setListViewItemsStateOnListItemUpsert(
          listViewItemsState,
          null,
          listItemViewModel,
          listViewItemsState.filterQueryString.value,
        );

        final indexOfNewListViewItem = listViewItemsState
            .filteredListViewItems.value
            .indexOf(listItemViewModel);

        stateService.setListViewSelectedIndexState(
            listViewSelectedIndexState, indexOfNewListViewItem);

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          indexOfNewListViewItem >= 0 ? detailsViewViewModel : null,
        );

        stateService.setNavigationCurrentIndexState(
          navigationCurrentIndexState,
          routes.listDetailLayoutPageIndex,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> updateItem(
    UpdateListItemViewModel updateListItemViewModel,
    CommonStateDto commonState,
  ) {
    debugPrint('list item details getting updated');
    final detailsViewState = commonState.detailsViewState;
    final listViewItemsState = commonState.listViewItemsState!;
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    stateService.setDetailsViewState(
      detailsViewState,
      DetailsViewStateTypes.updatingData,
    );

    final command = ListDetailLayoutMapper.MapToUpdateListItemCommand(
        updateListItemViewModel)!;

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.updateItem(command);

        final listItemDetailsViewModel = ListDetailLayoutMapper
            .MapToDetailViewViewModelFromUpdateListItemViewModel(
                updateListItemViewModel);

        final listItemViewModel = ListDetailLayoutMapper
            .MapToListViewViewModelFromDetailViewViewModel(
                listItemDetailsViewModel)!;

        stateService.setListViewItemsStateOnListItemUpsert(
          listViewItemsState,
          listItemViewModel.id,
          listItemViewModel,
          listViewItemsState.filterQueryString.value,
        );

        final indexOfNewListViewItem = listViewItemsState
            .filteredListViewItems.value
            .indexOf(listItemViewModel);

        stateService.setListViewSelectedIndexState(
            listViewSelectedIndexState, indexOfNewListViewItem);

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          indexOfNewListViewItem >= 0 ? listItemDetailsViewModel : null,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> deleteItem(
    int itemId,
    CommonStateDto commonState,
  ) {
    debugPrint('list item details getting deleted');
    final listViewItemsState = commonState.listViewItemsState!;
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;
    final listViewSelectedItemState = commonState.listViewSelectedItemState;

    final command = ListDetailLayoutMapper.MapToDeleteListItemCommand(itemId);

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.deleteItem(command);

        final unfilteredListViewItemsExceptDeleted =
            List<ListItemViewModel>.from(listViewItemsState.listViewItems.value)
                .where((item) => item.id != command.id)
                .toList();

        final filteredListViewItemsExceptDeleted = List<ListItemViewModel>.from(
                listViewItemsState.filteredListViewItems.value)
            .where((item) => item.id != command.id)
            .toList();

        stateService.setUnfilteredListViewItemsState(
          listViewItemsState,
          unfilteredListViewItemsExceptDeleted,
        );

        stateService.setFilteredListViewItemsState(
          listViewItemsState,
          filteredListViewItemsExceptDeleted,
        );

        stateService.setListViewSelectedIndexState(
          listViewSelectedIndexState,
          -1,
        );
        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          null,
        );
      },
    );
  }

  void closeItemDetails(CommonStateDto commonState) {
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState;
    final listViewSelectedItemState = commonState.listViewSelectedItemState;

    stateService.setListViewSelectedIndexState(listViewSelectedIndexState, -1);
    stateService.setListViewSelectedItemState(listViewSelectedItemState, null);
  }

  Future<void> onListTileTap(
    int selectedIndex,
    CommonStateDto commonState,
  ) async {
    debugPrint('Selected list view item index: $selectedIndex');

    final listViewItemsState = commonState.listViewItemsState!;
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    listViewSelectedIndexState.selectedIndex.value = selectedIndex;

    final selectedItemFromState = listViewSelectedItemState.selectedItem.value;

    final selectedItem = selectedIndex >= 0
        ? listViewItemsState.filteredListViewItems.value[selectedIndex]
        : null;

    if (!(selectedItemFromState?.id == selectedItem?.id)) {
      stateService.setListViewSelectedItemState(
          listViewSelectedItemState, null);

      if (selectedItem != null) {
        await getItemDetails(selectedItem.id, selectedItem.title, commonState);
      }
    }
  }

  void searchItems(String queryString, CommonStateDto commonState) {
    final listViewItemsState = commonState.listViewItemsState!;
    final filteredItems = listViewItemsState.listViewItems.value
        .where((item) => item.title.toLowerCase().contains(queryString))
        .toList();

    stateService.setFilterQueryStringState(listViewItemsState, queryString);

    stateService.setFilteredListViewItemsState(
        listViewItemsState, filteredItems);
    return;
  }

  void clearSearch(CommonStateDto commonState) {
    final listViewItemsState = commonState.listViewItemsState!;

    final items =
        List<ListItemViewModel>.from(listViewItemsState.listViewItems.value);

    stateService.setFilterQueryStringState(listViewItemsState, "");

    stateService.setFilteredListViewItemsState(listViewItemsState, items);

    return;
  }
}
