import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/enums/todo_status.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class TodoState {
  final List<Todo> todos;
  final TodoStatus filterTodoStatus;
  final String todoSearchQuery;

  const TodoState({
    required this.filterTodoStatus,
    required this.todos,
    required this.todoSearchQuery,
  });

  TodoState copyWith({
    List<Todo>? todos,
    TodoStatus? filterTodoStatus,
    String? todoSearchQuery,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      filterTodoStatus: filterTodoStatus ?? this.filterTodoStatus,
      todoSearchQuery: todoSearchQuery ?? this.todoSearchQuery,
    );
  }
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
    : super(
        const TodoState(
          todos: [],
          filterTodoStatus: TodoStatus.all,
          todoSearchQuery: '',
        ),
      );

  // Create
  void addTodo(String title) {
    emit(
      state.copyWith(
        todos: [
          Todo.create(title: title),
          ...state.todos,
        ],
      ),
    );
  }

  // Read
  Todo? getTodoById(int id) {
    try {
      return state.todos.firstWhere((todo) => todo.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Todo> get filteredTodos => getFilteredTodos();

  List<Todo> getFilteredTodos() {
    final filter = state.filterTodoStatus;
    final q = state.todoSearchQuery;

    if (q.isEmpty && filter == TodoStatus.all) {
      return state.todos;
    }

    // Filter by query and status
    var filteredTodos = state.todos.where((todo) {
      bool doesStatusFitFilter = false;
      switch (filter) {
        case TodoStatus.complete:
          doesStatusFitFilter = todo.completed == true;
          break;
        case TodoStatus.incomplete:
          doesStatusFitFilter = todo.completed == false;
          break;
        case TodoStatus.all:
        // ignore: unreachable_switch_default
        default:
          doesStatusFitFilter = true;
          break;
      }
      // PROG gonna do  update todos
      // Case insensitive search in title
      final regex = RegExp(q, caseSensitive: false);
      final doesTitleMatchQuery = regex.hasMatch(todo.title);

      return doesStatusFitFilter && doesTitleMatchQuery;
    });

    return filteredTodos.toList();
  }

  // Update - Todo
  void updateTodo(int id, {String? title, bool? completed}) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: title ?? todo.title,
          completed: completed ?? todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  void populateTodos(TodoList newTodos) {
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodoCompletion(int id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, title: todo.title, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  // Update - Filter
  void setFilterTodoStatus(TodoStatus newStatus) {
    emit(state.copyWith(filterTodoStatus: newStatus));
  }

  // Delete
  void deleteTodo(int id) {
    final updatedTodos = state.todos.where((todo) => todo.id != id).toList();
    emit(state.copyWith(todos: updatedTodos));
  }

  // Query

  void setTodoSearchQuery(String q) {
    emit(state.copyWith(todoSearchQuery: q));
  }
}
