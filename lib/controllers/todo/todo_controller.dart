import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_api.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

/// Combines todoCubit and todoAPI to have optimistic UI updates
class TodoController {
  final TodoCubit todoCubit;
  final TodosApi todoAPI = TodosApi();

  TodoController({required this.todoCubit});

  // TODO add toasts if possible
  Future<Todo> addTodo(String title) async {
    todoCubit.addTodo(title);
    return await todoAPI.createTodo(title);
  }
}
