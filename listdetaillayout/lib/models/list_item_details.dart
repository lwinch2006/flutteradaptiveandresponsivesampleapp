import 'package:listdetaillayout/view_models/list_item_details_viewmodel.dart';

class ListItemDetails {
  final int itemId;
  final String itemTitle;
  final String username;
  final String password;

  const ListItemDetails({
    required this.itemId,
    required this.itemTitle,
    required this.username,
    required this.password,
  });
}

extension ListItemDetailsMapping on ListItemDetails {
  ListItemDetailsViewModel toDetailViewViewModel() {
    return ListItemDetailsViewModel(
      id: itemId,
      title: itemTitle,
      username: username,
      password: password,
    );
  }
}
