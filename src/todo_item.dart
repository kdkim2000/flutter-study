class TodoItem {
  final String id;
  final String title;
  bool completed;

  TodoItem({
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory TodoItem.fromMap(String id, Map<String, dynamic> data) {
    return TodoItem(
      id: id,
      title: data['title'] ?? '',
      completed: data['completed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'completed': completed};
  }
}
