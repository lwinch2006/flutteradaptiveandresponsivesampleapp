import 'package:flutter/material.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/ilist_detail_repository.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/delete_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/ilist_detail_service.dart';

class ListDetailService implements IListDetailService {
  final IListDetailRepository listDetailRepository;
  const ListDetailService({required this.listDetailRepository});

  Future<List<ListItem>> getItems() {
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        final listItems = await listDetailRepository.getItems();
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
            await listDetailRepository.getItemDetails(itemId);

        return listItemDetails;
      },
    );
  }

  Future<int> createNewItem(CreateNewListItemCommand command) {
    debugPrint('list item details getting added');
    return Future.delayed(const Duration(seconds: 5), () async {
      final newId = await listDetailRepository.createItem(command);
      return newId;
    });
  }

  Future<void> updateItem(UpdateListItemCommand command) {
    debugPrint('list item details getting updated');
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailRepository.updateItem(command);
      },
    );
  }

  Future<void> deleteItem(DeleteListItemCommand command) {
    debugPrint('list item details getting deleted');
    return Future.delayed(
      const Duration(seconds: 5),
      () async {
        await listDetailRepository.deleteItem(command);
      },
    );
  }
}
