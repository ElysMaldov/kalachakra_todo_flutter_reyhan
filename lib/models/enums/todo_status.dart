// Enhanced enums
enum TodoStatus {
  all('All'),
  complete('Complete'),
  incomplete('Incomplete');

  const TodoStatus(this.label);
  final String label;
}
