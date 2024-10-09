import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/list_detail_layout_repository.dart';
import 'package:listdetaillayoutwithcubit/application/utils/mappers/list_detail_layout_mapper.dart';
import 'package:listdetaillayoutwithcubit/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/update_list_item_viewmodel.dart';

class ListDetailLayoutService {
  final ListDetailLayoutRepository listDetailLayoutRepository;

  const ListDetailLayoutService({required this.listDetailLayoutRepository});

  Future<List<ListItem>> getItems() {
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        final listItems = await listDetailLayoutRepository.getItems();
        return listItems;
      },
    );
  }

  Future<ListItemDetails?> getItemDetails(
    int itemId,
    String itemTitle,
  ) {
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        final listItemDetails =
            await listDetailLayoutRepository.getItemDetails(itemId);

        return listItemDetails;
      },
    );
  }

  Future<int> createNewItem(
      CreateNewListItemViewModel createNewListItemViewModel) {
    debugPrint('list item details getting added');
    return Future.delayed(const Duration(seconds: 5), () async {
      final command = ListDetailLayoutMapper.MapToCreateNewListItemCommand(
          createNewListItemViewModel)!;
      final newId = await listDetailLayoutRepository.createItem(command);
      return newId;
    });
  }

  Future<void> updateItem(UpdateListItemViewModel updateListItemViewModel) {
    debugPrint('list item details getting updated');
    final command = ListDetailLayoutMapper.MapToUpdateListItemCommand(
        updateListItemViewModel)!;

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.updateItem(command);
      },
    );
  }

  Future<void> deleteItem(int itemId) {
    debugPrint('list item details getting deleted');
    final command = ListDetailLayoutMapper.MapToDeleteListItemCommand(itemId);

    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.deleteItem(command);
      },
    );
  }
}
