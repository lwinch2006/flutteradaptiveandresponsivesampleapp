import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/list_detail_repository.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/delete_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';

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

  Future<int> createNewItem(CreateNewListItemCommand command) {
    debugPrint('list item details getting added');
    return Future.delayed(const Duration(seconds: 5), () async {
      final newId = await listDetailLayoutRepository.createItem(command);
      return newId;
    });
  }

  Future<void> updateItem(UpdateListItemCommand command) {
    debugPrint('list item details getting updated');
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.updateItem(command);
      },
    );
  }

  Future<void> deleteItem(DeleteListItemCommand command) {
    debugPrint('list item details getting deleted');
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailLayoutRepository.deleteItem(command);
      },
    );
  }
}
