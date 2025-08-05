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
}
