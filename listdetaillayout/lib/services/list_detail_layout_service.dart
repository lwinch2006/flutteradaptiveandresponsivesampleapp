import 'package:flutter/material.dart';
import 'package:listdetaillayout/dtos/common_state_dto.dart';
import 'package:listdetaillayout/dummy_data.dart';
import 'package:listdetaillayout/models/details_view_state_types.dart';
import 'package:listdetaillayout/models/list_item_details.dart';
import 'package:listdetaillayout/services/state_service.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

class ListDetailLayoutService {
  final StateService stateService;

  const ListDetailLayoutService({
    required this.stateService,
  });

  Future<List<ListViewViewModel>> getItems() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        const listItems = dummyListItems;
        final response = listItems.map((listItem) {
          return ListViewViewModel(id: listItem.id, title: listItem.title);
        });

        return response.toList();
      },
    );
  }

  Future<void> getItemDetails(
    int itemId,
    String itemTitle,
    CommonStateDto commonState,
  ) {
    final detailsViewState = commonState.detailsViewState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    stateService.setDetailsViewState(
      detailsViewState,
      DetailsViewStateTypes.loadingData,
    );

    return Future.delayed(
      const Duration(seconds: 5),
      () {
        final listItem = dummyListItemsDetails[itemId]!;
        final response = listItem.toDetailViewViewModel();

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          response,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> updateItemDetails(
    DetailViewViewModel detailViewViewModel,
    CommonStateDto commonState,
  ) {
    final detailsViewState = commonState.detailsViewState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    stateService.setDetailsViewState(
      detailsViewState,
      DetailsViewStateTypes.updatingData,
    );

    return Future.delayed(
      const Duration(seconds: 5),
      () {
        debugPrint('list item details got updated');

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          detailViewViewModel,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> addItemDetails(
    DetailViewViewModel detailViewViewModel,
    CommonStateDto commonState,
  ) {
    final detailsViewState = commonState.detailsViewState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    stateService.setDetailsViewState(
        detailsViewState, DetailsViewStateTypes.addingData);

    return Future.delayed(
      const Duration(seconds: 5),
      () {
        debugPrint('list item details got added');

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          detailViewViewModel,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  Future<void> deleteItemDetails(
    DetailViewViewModel detailViewViewModel,
    CommonStateDto commonState,
  ) {
    final detailsViewState = commonState.detailsViewState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

    stateService.setDetailsViewState(
        detailsViewState, DetailsViewStateTypes.deletingData);

    return Future.delayed(
      const Duration(seconds: 5),
      () {
        debugPrint('list item details got deleted');

        stateService.setListViewSelectedItemState(
          listViewSelectedItemState,
          null,
        );

        stateService.setDetailsViewState(
          detailsViewState,
          DetailsViewStateTypes.loadedData,
        );
      },
    );
  }

  void closeItemDetails(CommonStateDto commonState) {
    final listViewSelectedIndexState = commonState.listViewSelectedIndexState!;
    final listViewSelectedItemState = commonState.listViewSelectedItemState!;

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
        ? listViewItemsState.listViewItems.value[selectedIndex]
        : null;

    if (!(selectedItemFromState?.itemId == selectedItem?.id)) {
      stateService.setListViewSelectedItemState(
          listViewSelectedItemState, null);

      if (selectedItem != null) {
        await getItemDetails(selectedItem.id, selectedItem.title, commonState);
      }
    }
  }
}
