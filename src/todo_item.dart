class TodoItem {
  final String id; // Firestore 문서 ID
  final String title; // 할 일 제목
  bool completed; // 완료 여부

  TodoItem({required this.id, required this.title, this.completed = false});

  // Firestore에서 읽어오기 (Map -> 객체)
  factory TodoItem.fromMap(String id, Map<String, dynamic> data) {
    return TodoItem(
      id: id,
      title: data['title'] ?? '',
      completed: data['completed'] ?? false,
    );
  }

  // Firestore로 저장(Map)
  Map<String, dynamic> toMap() {
    return {'title': title, 'completed': completed};
  }
}
