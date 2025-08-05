typedef TodoList = List<Todo>;

class Todo {
  final int id;
  final String title;
  final bool completed;

  const Todo({required this.id, required this.title, this.completed = false});

  // Use factory so id can be unique
  factory Todo.create({required String title, bool completed = false}) {
    return Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      completed: completed,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': int id, 'title': String title, 'completed': bool completed} =>
        Todo(id: id, title: title, completed: completed),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
