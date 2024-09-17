final class DetailViewViewModel {
  final int? id;
  final String title;
  final String username;
  final String password;

  const DetailViewViewModel({
    this.id,
    required this.title,
    required this.username,
    required this.password,
  });

  DetailViewViewModel copyWith({
    int? itemId,
    String? itemTitle,
    String? username,
    String? password,
  }) {
    return DetailViewViewModel(
      id: itemId ?? this.id,
      title: itemTitle ?? this.title,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
