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
}
