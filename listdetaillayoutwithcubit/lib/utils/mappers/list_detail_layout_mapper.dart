import 'package:listdetaillayoutwithcubit/application/models/list_item.dart';
import 'package:listdetaillayoutwithcubit/application/models/list_item_details.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/create_new_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/delete_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/application/services/commands/update_list_item_command.dart';
import 'package:listdetaillayoutwithcubit/view_models/create_new_list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_details_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/list_item_viewmodel.dart';
import 'package:listdetaillayoutwithcubit/view_models/update_list_item_viewmodel.dart';

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
      id: source.id,
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

  static ListItemViewModel? MapToListViewViewModelFromListItem(
      ListItem? source) {
    if (source == null) {
      return null;
    }

    final destination = ListItemViewModel(
      id: source.id,
      title: source.title,
    );

    return destination;
  }

  static ListItemViewModel? MapToListViewViewModelFromDetailViewViewModel(
      ListItemDetailsViewModel? source) {
    if (source == null) {
      return null;
    }

    return ListItemViewModel(
      id: source.id!,
      title: source.title,
    );
  }

  static List<ListItemViewModel> MapToListViewViewModels(
      List<ListItem> source) {
    return source
        .map((item) => MapToListViewViewModelFromListItem(item)!)
        .toList();
  }

  static ListItemDetailsViewModel? MapToDetailViewViewModelFromListItemDetails(
      ListItemDetails? source) {
    if (source == null) {
      return null;
    }

    final destination = ListItemDetailsViewModel(
      id: source.itemId,
      title: source.itemTitle,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static ListItemDetailsViewModel?
      MapToDetailViewViewModelFromCreateNewListItemViewModel(
          int id, CreateNewListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = ListItemDetailsViewModel(
      id: id,
      title: source.title,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static ListItemDetailsViewModel?
      MapToDetailViewViewModelFromUpdateListItemViewModel(
          UpdateListItemViewModel? source) {
    if (source == null) {
      return null;
    }

    final destination = ListItemDetailsViewModel(
      id: source.id,
      title: source.title,
      username: source.username,
      password: source.password,
    );

    return destination;
  }

  static CreateNewListItemViewModel? MapToCreateNewListItemViewModel(
      ListItemDetailsViewModel? source) {
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
      ListItemDetailsViewModel? source) {
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
