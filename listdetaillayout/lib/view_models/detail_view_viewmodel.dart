final class DetailViewViewModel {
  final int? itemId;
  final String itemTitle;
  final String username;
  final String password;

  const DetailViewViewModel(
      {this.itemId,
      required this.itemTitle,
      required this.username,
      required this.password});

  DetailViewViewModel copyWith({
    int? itemId,
    String? itemTitle,
    String? username,
    String? password,
  }) {
    return DetailViewViewModel(
      itemId: itemId ?? this.itemId,
      itemTitle: itemTitle ?? this.itemTitle,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
