final class ListItemViewModel implements Comparable<ListItemViewModel> {
  final int id;
  final String title;
  const ListItemViewModel({required this.id, required this.title});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is ListItemViewModel) {
      return id == other.id &&
          title == other.title &&
          runtimeType == other.runtimeType;
    }

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  int compareTo(ListItemViewModel other) {
    if (identical(this, other) || (id == other.id && title == other.title)) {
      return 0;
    }

    final idComparison = id.compareTo(other.id);
    if (idComparison != 0) {
      return idComparison;
    }

    return title.compareTo(other.title);
  }
}
