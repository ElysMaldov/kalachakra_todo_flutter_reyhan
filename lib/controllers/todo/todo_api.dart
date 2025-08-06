import 'dart:convert';

import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';
import 'package:http/http.dart' as http;

/// Interact with Kalachakra Todo APIs
class TodosApi {
  final String baseURL = "https://todo-api.kalachakra.io";

  TodosApi();

  Future<Todo> createTodo(String title) async {
    final response = await http.post(
      Uri.parse("$baseURL/todos"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create Todo');
    }
  }

  Future<TodoList> getTodos() async {
    final response = await http.get(Uri.parse("$baseURL/todos"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

      return jsonList
          .map((json) => Todo.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Todo> getTodoById(int id) async {
    final response = await http.get(Uri.parse("$baseURL/todos/$id"));

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw TodoNotFoundException();
    } else {
      throw Exception('Failed to load Todo');
    }
  }

  Future<Todo> updateTodo(Todo newTodoData) async {
    final response = await http.put(
      Uri.parse("$baseURL/todos/${newTodoData.id}"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newTodoData.toJson()),
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw TodoNotFoundException();
    } else {
      throw Exception('Failed to update Todo');
    }
  }

  Future<Todo> toggleTodo(Todo todo) async {
    final toggledTodo = Todo(
      id: todo.id,
      title: todo.title,
      completed: !todo.completed,
    );

    final response = await http.put(
      Uri.parse("$baseURL/todos/${todo.id}"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(toggledTodo.toJson()),
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw TodoNotFoundException();
    } else {
      throw Exception('Failed to toggle Todo');
    }
  }

  Future<Todo> deleteTodo(int id) async {
    final response = await http.delete(Uri.parse("$baseURL/todos/$id"));

    if (response.statusCode == 200 || response.statusCode == 204) {
      return Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 404) {
      throw TodoNotFoundException();
    } else {
      throw Exception('Failed to delete Todo');
    }
  }
}

/// Throw when [Todo] with id is not found.
class TodoNotFoundException implements Exception {
  final String message;

  const TodoNotFoundException([this.message = 'Todo not found']);

  @override
  String toString() => 'TodoNotFoundException: $message';
}
