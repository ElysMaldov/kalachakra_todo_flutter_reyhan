import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/add_todo_button.dart';
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
              Column(children: [TodoScreenHeader()]),

              Positioned(bottom: 32, right: 8, child: AddTodoButton()),
            ],
          ),
        ),
      ),
    );
  }
}
