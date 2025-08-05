import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo_api.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<TodoList> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = TodosApi().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: BlocBuilder<TodoCubit, TodoState>(
      //     builder: (context, state) {
      //       // context.read<TodoCubit>().addTodo();
      //       return Text(
      //         "${state.todos}",
      //         style: GoogleFonts.inter(fontWeight: FontWeight.w700),
      //       );
      //     },
      //   ),
      // ),
      body: FutureBuilder<TodoList>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data![0].title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
