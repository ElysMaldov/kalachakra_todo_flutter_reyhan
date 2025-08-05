import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/enums/todo_status.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class TodoState {
  final List<Todo> todos;
  final TodoStatus filterTodoStatus;

  const TodoState({required this.filterTodoStatus, required this.todos});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(
      todos: todos ?? this.todos,
      filterTodoStatus: TodoStatus.all,
    );
  }
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
    : super(const TodoState(todos: [], filterTodoStatus: TodoStatus.all));

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
  List<Todo> get todos => state.todos;

  Todo? getTodoById(int id) {
    try {
      return state.todos.firstWhere((todo) => todo.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Todo> get completedTodos =>
      state.todos.where((todo) => todo.completed).toList();

  List<Todo> get incompleteTodos =>
      state.todos.where((todo) => !todo.completed).toList();

  // Update
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

  void toggleTodoCompletion(int id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, title: todo.title, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  // Delete
  void deleteTodo(int id) {
    final updatedTodos = state.todos.where((todo) => todo.id != id).toList();
    emit(state.copyWith(todos: updatedTodos));
  }
}
