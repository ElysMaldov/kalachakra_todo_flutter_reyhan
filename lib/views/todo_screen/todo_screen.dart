import 'package:flutter/material.dart';
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
          child: Column(children: [TodoScreenHeader()]),
        ),
      ),
    );
  }
}
