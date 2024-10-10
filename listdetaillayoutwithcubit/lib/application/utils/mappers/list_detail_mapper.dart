import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';

final class ListDetailMapper {
  const ListDetailMapper._();

  static ListItem? MapToListItemFromCreateCommand(
      int id, CreateNewListItemCommand? command) {
    if (command == null) {
      return null;
    }

    final destination = ListItem(
      id: id,
      title: command.title,
    );

    return destination;
  }

  static ListItem? MapToListItemFromUpdateCommand(
      UpdateListItemCommand? command) {
    if (command == null) {
      return null;
    }

    final destination = ListItem(
      id: command.id,
      title: command.title,
    );

    return destination;
  }

  static ListItemDetails? MapToListItemDetailsFromCreateCommand(
      int id, CreateNewListItemCommand? command) {
    if (command == null) {
      return null;
    }

    final destination = ListItemDetails(
      itemId: id,
      itemTitle: command.title,
      username: command.username,
      password: command.password,
    );

    return destination;
  }

  static ListItemDetails? MapToListItemDetailsFromUpdateCommand(
      UpdateListItemCommand? command) {
    if (command == null) {
      return null;
    }

    final destination = ListItemDetails(
      itemId: command.id,
      itemTitle: command.title,
      username: command.username,
      password: command.password,
    );

    return destination;
  }
}
