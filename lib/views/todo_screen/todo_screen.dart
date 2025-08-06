import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/components/buttons/add_todo_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/components/todo_list/todo_list.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/todo_screen/todo_screen_header.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 360, maxWidth: 750),
          child: Stack(
            children: [
              Column(children: [TodoScreenHeader(), TodoList()]),

              Positioned(bottom: 32, right: 8, child: AddTodoButton()),
            ],
          ),
        ),
      ),
    );
  }
}
