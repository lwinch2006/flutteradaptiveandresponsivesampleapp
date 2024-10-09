final class ListItemDetailsViewModel {
  final int? id;
  final String title;
  final String username;
  final String password;

  const ListItemDetailsViewModel({
    this.id,
    required this.title,
    required this.username,
    required this.password,
  });

  ListItemDetailsViewModel copyWith({
    int? itemId,
    String? itemTitle,
    String? username,
    String? password,
  }) {
    return ListItemDetailsViewModel(
      id: itemId ?? this.id,
      title: itemTitle ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
