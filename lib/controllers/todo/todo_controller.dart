import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_api.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

// TODO right now if an error happens, the methods don't revert the state; need to add that

/// Combines todoCubit and todoAPI to have optimistic UI updates
class TodoController {
  final TodoCubit todoCubit;
  final TodosApi todoAPI = TodosApi();

  TodoController({required this.todoCubit});

  Future<Todo> addTodo(String title) async {
    try {
      todoCubit.addTodo(title);
      return await todoAPI.createTodo(title);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<TodoList> loadTodos() async {
    try {
      var newTodos = await todoAPI.getTodos();

      todoCubit.populateTodos(newTodos);

      return newTodos;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Todo> updateTodo(Todo updatedTodo) async {
    try {
      todoCubit.updateTodo(
        updatedTodo.id,
        title: updatedTodo.title,
        completed: updatedTodo.completed,
      );
      return await todoAPI.updateTodo(updatedTodo);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Todo> toggleTodo(Todo todo) async {
    try {
      todoCubit.toggleTodoCompletion(todo.id);
      return await todoAPI.toggleTodo(todo);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Todo> deleteTodo(int id) async {
    try {
      todoCubit.deleteTodo(id);
      return await todoAPI.deleteTodo(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
