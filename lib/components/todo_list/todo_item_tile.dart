import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class TodoItemTile extends StatelessWidget {
  final Todo todo;
  const TodoItemTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      leading: Checkbox(value: true, onChanged: (value) {}),
      trailing: SizedBox(
        // TODO fix width
        width: 80,
        child: Row(
          children: [
            // TODO use svg from figma for the icons
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
