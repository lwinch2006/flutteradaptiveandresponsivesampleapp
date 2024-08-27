final class ListViewItemDetailsDTO {
  final int itemId;
  final String itemTitle;
  final String username;
  final String password;

  const ListViewItemDetailsDTO(
      {required this.itemId,
      required this.itemTitle,
      required this.username,
      required this.password});
}
