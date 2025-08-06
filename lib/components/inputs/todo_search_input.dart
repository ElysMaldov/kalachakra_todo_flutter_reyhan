import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/inputs/input.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';

class TodoSearchInput extends StatefulWidget {
  const TodoSearchInput({super.key});

  @override
  State<TodoSearchInput> createState() => _TodoSearchInputState();
}

class _TodoSearchInputState extends State<TodoSearchInput> {
  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return SizedBox(
      height: 38,
      child: Input(
        onChanged: (q) => todoCubit.setTodoSearchQuery(q),
        hintText: "Search note...",
        // FIXME size not correct
        icon: SvgPicture.asset(
          "icons/search-icon.svg",
          semanticsLabel: "Search Icon",
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
