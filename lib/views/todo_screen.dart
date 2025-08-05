import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo_cubit.dart';

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
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            // context.read<TodoCubit>().addTodo();
            return Text(
              "${state.todos}",
              style: GoogleFonts.inter(fontWeight: FontWeight.w700),
            );
          },
        ),
      ),
    );
  }
}
