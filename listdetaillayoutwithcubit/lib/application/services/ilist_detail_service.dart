import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/delete_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';

abstract interface class IListDetailService {
  Future<List<ListItem>> getItems();
  Future<ListItemDetails?> getItemDetails(int itemId, String itemTitle);
  Future<int> createNewItem(CreateNewListItemCommand command);
  Future<void> updateItem(UpdateListItemCommand command);
  Future<void> deleteItem(DeleteListItemCommand command);
}
