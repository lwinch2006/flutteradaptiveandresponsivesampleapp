import 'dart:math';

import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/repositories/dummy_data.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/delete_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/utils/mappers/list_detail_layout_mapper.dart';

class ListDetailLayoutRepository {
  const ListDetailLayoutRepository();

  Future<List<ListItem>> getItems() {
    return Future.delayed(const Duration(seconds: 1), () {
      return dummyListItems;
    });
  }

  Future<ListItemDetails?> getItemDetails(int id) {
    return Future.delayed(const Duration(seconds: 1), () {
      final itemDetails = dummyListItemsDetails[id];
      return itemDetails;
    });
  }

  Future<int> createItem(CreateNewListItemCommand command) {
    return Future.delayed(const Duration(seconds: 1), () {
      final newId = Random().nextInt(100);
      final newListItem = ListDetailLayoutMapper.MapToListItemFromCreateCommand(
          newId, command)!;
      final newListItemDetails =
          ListDetailLayoutMapper.MapToListItemDetailsFromCreateCommand(
              newId, command)!;

      dummyListItems.add(newListItem);
      dummyListItemsDetails[newId] = newListItemDetails;

      return newId;
    });
  }

  Future<void> updateItem(UpdateListItemCommand command) {
    return Future.delayed(const Duration(seconds: 1), () {
      final updatedListItem =
          ListDetailLayoutMapper.MapToListItemFromUpdateCommand(command)!;
      final updatedListItemDetails =
          ListDetailLayoutMapper.MapToListItemDetailsFromUpdateCommand(
              command)!;

      for (var i = 0; i < dummyListItems.length; i++) {
        if (dummyListItems[i].id == updatedListItem.id) {
          dummyListItems[i] = updatedListItem;
          break;
        }
      }

      dummyListItemsDetails[command.id] = updatedListItemDetails;
      return;
    });
  }

  Future<void> deleteItem(DeleteListItemCommand command) {
    return Future.delayed(const Duration(seconds: 1), () {
      for (var i = 0; i < dummyListItems.length; i++) {
        if (dummyListItems[i].id == command.id) {
          dummyListItems.removeAt(i);
          break;
        }
      }

      dummyListItemsDetails.remove(command.id);
      return;
    });
  }
}
