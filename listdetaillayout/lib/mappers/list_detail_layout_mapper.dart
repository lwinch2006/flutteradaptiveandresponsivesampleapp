import 'package:listdetaillayout/commands/create_new_list_item_command.dart';
import 'package:listdetaillayout/commands/delete_list_item_command.dart';
import 'package:listdetaillayout/commands/update_list_item_command.dart';
import 'package:listdetaillayout/models/list_item.dart';
import 'package:listdetaillayout/models/list_item_details.dart';
import 'package:listdetaillayout/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/list_view_viewmodel.dart';
import 'package:listdetaillayout/view_models/update_list_item_viewmodel.dart';

final class ListDetailLayoutMapper {
  const ListDetailLayoutMapper._();

  static CreateNewListItemCommand? MapToCreateNewListItemCommand(
      CreateNewListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = CreateNewListItemCommand(
      title: source.title,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static UpdateListItemCommand? MapToUpdateListItemCommand(
      UpdateListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = UpdateListItemCommand(
      id: source.id!,
      title: source.title,
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
      id: source.id!,
      title: source.title,
    );
  }

  static List<ListViewViewModel> MapToListViewViewModels(
      List<ListItem> source) {
    return source
        .map((item) => MapToListViewViewModelFromListItem(item)!)
        .toList();
  }

  static DetailViewViewModel? MapToDetailViewViewModelFromListItemDetails(
      ListItemDetails? source) {
    if (source == null) {
      return null;
    }

    var destination = DetailViewViewModel(
      id: source.itemId,
      title: source.itemTitle,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static DetailViewViewModel?
      MapToDetailViewViewModelFromCreateNewListItemViewModel(
          int id, CreateNewListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = DetailViewViewModel(
      id: id,
      title: source.title,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static DetailViewViewModel?
      MapToDetailViewViewModelFromUpdateListItemViewModel(
          UpdateListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = DetailViewViewModel(
      id: source.id,
      title: source.title,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static CreateNewListItemViewModel? MapToCreateNewListItemViewModel(
      DetailViewViewModel? source) {
    if (source == null) {
      return null;
    }

    return CreateNewListItemViewModel(
      title: source.title,
      username: source.username,
      password: source.password,
    );
  }

  static UpdateListItemViewModel? MapToUpdateListItemViewModel(
      DetailViewViewModel? source) {
    if (source == null) {
      return null;
    }

    return UpdateListItemViewModel(
      id: source.id!,
      title: source.title,
      username: source.username,
      password: source.password,
    );
  }
}
