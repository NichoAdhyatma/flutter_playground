class TodoModel {
  final String title;
  final DateTime createdAt;

  const TodoModel({
    required this.title,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'TodoModel{title: $title, createdAt: $createdAt}';
  }
}
