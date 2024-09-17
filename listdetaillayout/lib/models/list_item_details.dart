import 'package:listdetaillayout/view_models/detail_view_viewmodel.dart';

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
  DetailViewViewModel toDetailViewViewModel() {
    return DetailViewViewModel(
      id: itemId,
      title: itemTitle,
      username: username,
      password: password,
    );
  }
}
