import 'package:listdetaillayout/commands/create_new_list_item_command.dart';
import 'package:listdetaillayout/commands/delete_list_item_command.dart';
import 'package:listdetaillayout/commands/update_list_item_command.dart';
import 'package:listdetaillayout/models/list_item.dart';
import 'package:listdetaillayout/models/list_item_details.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';

final class ListDetailLayoutMapper {
  static CreateNewListItemCommand MapToCreateNewListItemCommand(
      DetailViewViewModel source) {
    final destination = CreateNewListItemCommand(
      title: source.itemTitle,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static UpdateListItemCommand MapToUpdateListItemCommand(
      DetailViewViewModel source) {
    final destination = UpdateListItemCommand(
      id: source.itemId!,
      title: source.itemTitle,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static DeleteListItemCommand MapToDeleteListItemCommand(int id) {
    return DeleteListItemCommand(
      id: id,
    );
  }

  static ListItem MapToListItemFromCreateCommand(
      int id, CreateNewListItemCommand command) {
    final destination = ListItem(
      id: id,
      title: command.title,
    );

    return destination;
  }

  static ListItem MapToListItemFromUpdateCommand(
      UpdateListItemCommand command) {
    final destination = ListItem(
      id: command.id,
      title: command.title,
    );

    return destination;
  }

  static ListItemDetails MapToListItemDetailsFromCreateCommand(
      int id, CreateNewListItemCommand command) {
    final destination = ListItemDetails(
      itemId: id,
      itemTitle: command.title,
      username: command.username,
      password: command.password,
    );

    return destination;
  }

  static ListItemDetails MapToListItemDetailsFromUpdateCommand(
      UpdateListItemCommand command) {
    final destination = ListItemDetails(
      itemId: command.id,
      itemTitle: command.title,
      username: command.username,
      password: command.password,
    );

    return destination;
  }

  static ListViewViewModel? MapToListViewViewModelFromListItem(
      ListItem? source) {
    if (source == null) {
      return null;
    }

    final destination = ListViewViewModel(
      id: source.id,
      title: source.title,
    );

    return destination;
  }

  static ListViewViewModel? MapToListViewViewModelFromDetailViewViewModel(
      DetailViewViewModel? source) {
    if (source == null) {
      return null;
    }

    return ListViewViewModel(
      id: source.itemId!,
      title: source.itemTitle,
    );
  }

  static List<ListViewViewModel> MapToListViewViewModels(
      List<ListItem> source) {
    return source
        .map((item) => MapToListViewViewModelFromListItem(item)!)
        .toList();
  }

  static DetailViewViewModel? MapToDetailViewViewModel(
      ListItemDetails? source) {
    if (source == null) {
      return null;
    }

    var destination = DetailViewViewModel(
      itemId: source.itemId,
      itemTitle: source.itemTitle,
      username: source.username,
      password: source.password,
    );

    return destination;
  }
}
