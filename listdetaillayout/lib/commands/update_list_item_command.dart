final class UpdateListItemCommand {
  final int id;
  final String title;
  final String username;
  final String password;
  const UpdateListItemCommand({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
  });
}
